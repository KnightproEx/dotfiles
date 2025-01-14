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
              # GUI
              arc-browser
              discord
              vscode
              postman

              # TUI
              neovim
              tmux

              # Package Manager
              nodejs_22
              pnpm
              bun
              cargo

              # Sdk
              dotnet-sdk_8

              # Compiler
              rustc

              # Dev Tool
              ngrok
              bacon
              terraform
              packer
              kubeswitch
              kubernetes-helm

              # Other Tool
              bat
              fd
              fzf
              eza
              zoxide
              tree
              ripgrep
              mkalias
              qmk

              # TODO: Move them to brew
              sketchybar
              jankyborders

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

          # security.pam.enableSudoTouchIdAuth = true;

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
              "awscli"
            ];
            casks = [
              # Browser
              "zen-browser"

              # Terminal Emulator
              "ghostty"
              "wezterm"

              # Rice
              "nikitabobko/tap/aerospace"
              "raycast"
              "marta"

              # Messaging
              "messenger"
              "whatsapp"

              # Config
              "qmk-toolbox"
              "karabiner-elements"
              "logi-options+"
              "displaylink"

              # Dev
              "openvpn-connect"
              "sourcetree"
              "appium-inspector"
              "mysqlworkbench"
              "orbstack"
              "android-studio"

              # Font
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
