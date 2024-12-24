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

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          environment.systemPackages = with pkgs; [
            # GUI
            arc-browser
            discord
            vscode
            wezterm
            postman

            # Dev
            nodejs_22
            bun
            cargo
            pnpm
            bacon
            dotnet-sdk_8

            # CLI
            neovim
            tmux
            mkalias
            bat
            fd
            eza
            fzf
            zoxide
            ripgrep
            oh-my-posh
            jankyborders
            ngrok
            sketchybar

            # LSP
            nixd

            # Formatter
            nixfmt-rfc-style
            rustfmt

            # Compiler
            rustc
          ];

          homebrew = {
            enable = true;
            taps = [
              "homebrew/services"
            ];
            brews = [
              # dev
              "appium"
              "php"
              "nginx"
            ];
            casks = [
              # productivity
              "nikitabobko/tap/aerospace"
              "raycast"
              "marta"

              # messaging
              "messenger"
              "whatsapp"

              # config
              "logi-options+"
              "displaylink"

              # dev
              "openvpn-connect"
              "sourcetree"
              "appium-inspector"
              "mysqlworkbench"
              "orbstack"
              "android-studio"

              # font
              "font-sf-pro"
            ];
            onActivation = {
              cleanup = "zap";
              autoUpdate = true;
              upgrade = true;
            };
          };

          fonts.packages = with pkgs; [
            # (nerdfonts.override { fonts = [ "Hack" ]; })
            sketchybar-app-font
          ];

          security.pam.enableSudoTouchIdAuth = true;

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
                  ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
                done
              '';

            configurationRevision = self.rev or self.dirtyRev or null;
            stateVersion = 5;
            defaults = {
              dock = {
                autohide = true;
                show-recents = false;
              };
              NSGlobalDomain = {
                KeyRepeat = 1;
                InitialKeyRepeat = 20;
                ApplePressAndHoldEnabled = false;
                NSWindowShouldDragOnGesture = true;
                NSAutomaticWindowAnimationsEnabled = false;
              };
            };
          };

          services.nix-daemon.enable = true;
          programs.zsh.enable = true;
          home-manager.backupFileExtension = "backup";

          nix = {
            configureBuildUsers = true;
            useDaemon = true;
          };

          nixpkgs = {
            config.allowUnfree = true;
            hostPlatform = "aarch64-darwin";
          };

          users.users.bh = {
            name = "bh";
            home = "/Users/bh";
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
            home-manager.users.bh = import ./home.nix;
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "bh";
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."mac".pkgs;
    };
}
