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
          environment = {
            systemPackages = with pkgs; [
              # TUI
              neovim
              tmux
              yazi

              # Package Manager
              nodejs
              pnpm
              bun
              cargo

              # Compiler
              rustc

              # Dev Tool
              terraform
              packer
              kubeswitch
              kubernetes-helm
              bacon
              k9s
              lazygit

              # Monitoring Tool
              btop

              # Utilities
              bat
              fd
              fzf
              eza
              zoxide
              tree
              ripgrep
              mkalias
              qmk
              ffmpeg
              imagemagick
              fastfetch
              jq
              poppler

              # LSP
              nixd

              # Formatter
              nixfmt-rfc-style
              rustfmt
            ];

            etc."pam.d/sudo_local".text = ''
              # Managed by Nix Darwin
              auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
              auth       sufficient     pam_tid.so
            '';
          };

          homebrew = {
            enable = true;
            taps = [
              "felixkratz/formulae"
              "nikitabobko/tap"
            ];
            brews = [
              "nginx"
              "awscli"
              "php"
              "composer"
              "sevenzip"
              "borders"
            ];
            casks = [
              # Browser
              "arc"
              "zen-browser"

              # Terminal Emulator
              "ghostty"
              "wezterm"

              # Tool
              "aerospace"
              "raycast"
              "marta"
              # "sketchybar"

              # Messaging
              "messenger"
              "whatsapp"
              "discord"

              # Config
              "qmk-toolbox"
              "karabiner-elements"
              "logi-options+"
              "displaylink"

              # Dev
              "visual-studio-code"
              "openvpn-connect"
              "sourcetree"
              "mysqlworkbench"
              "orbstack"
              "postman"

              # Font
              "font-sf-pro"
              "font-symbols-only-nerd-font"
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
              finder = {
                _FXShowPosixPathInTitle = true;
              };
              NSGlobalDomain = {
                KeyRepeat = 1;
                InitialKeyRepeat = 15;
                ApplePressAndHoldEnabled = false;
                AppleShowAllExtensions = true;
                NSWindowShouldDragOnGesture = true;
                NSAutomaticWindowAnimationsEnabled = false;
                "com.apple.sound.beep.volume" = 0.0;
              };
              CustomUserPreferences = {
                "com.apple.security.authorization" = {
                  ignoreArd = true;
                };
              };
            };
          };

          services.nix-daemon.enable = true;
          programs.zsh.enable = true;
          home-manager.backupFileExtension = "backup";

          nix = {
            configureBuildUsers = true;
            useDaemon = true;
            # settings.auto-optimise-store = true;
            # optimise.automatic = true;
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
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.bh = import ./home.nix;
            };
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
