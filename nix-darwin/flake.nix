{
  description = "My Darwin System flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
    let
      configuration = { pkgs, config, ... }: {
        environment.systemPackages = with pkgs;
          [
            # arc-browser
            # vscode
            wezterm
            neovim
            tmux
            nodejs_22
            bun
            ngrok
            mkalias
            bat
            fd
            eza
            fzf
            zoxide
            ripgrep
            nixpkgs-fmt
          ];

        homebrew = {
          enable = true;
          casks = [
            "aerospace"
            "raycast"
            "marta"
          ];
          onActivation.cleanup = "zap";
        };

        fonts.packages = [ ];

        system = {
          activationScripts.application.text =
            let
              env = pkgs.build.Env {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              echo "setting up /Applications..." >&2
              rm -rf /Application/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/nix Apps/$app_name"
              done
            '';

          configurationRevision = self.rev or self.dirtyRev or null;
          stateVersion = 5;
          defaults = {
            dock.autohide = true;
          };
        };

        services.nix-daemon.enable = true;
        programs.zsh.enable = true;
        home-manager.backupFileExtension = "backup";

        nix = {
          settings.experimental-features = "nix-command flakes";
          configureBuildUsers = true;
          useDaemon = true;
        };

        nixpkgs = {
          config.allowUnfree = true;
          hostPlatform = "aarch64-darwin";
        };

        users.users.fmt = {
          name = "fmt";
          home = "/Users/fmt";
        };
      };
    in
    {
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.fmt = import ./home.nix;
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "fmt";
              autoMigrate = true;
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."mac".pkgs;
    };
}
