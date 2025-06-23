{inputs, ...}: {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    overwrite.enable = true;
    # hyprland.enable = true;

    settings = {
      layout = {
        "bar.layouts" = {
          "0" = {
            left = ["dashboard" "workspaces" "windowtitle"];
            middle = ["clock"];
            right = ["systray" "network" "bluetooth" "volume" "battery" "notifications"];
          };
        };
      };

      bar = {
        launcher.autoDetectIcon = true;
        clock.format = "%a %b %d  %I:%M %p";
        workspaces = {
          show_icons = true;
        };
      };

      menus.clock = {
        time = {
          military = false;
          hideSeconds = false;
        };
        weather.enabled = false;
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;
      menus.dashboard = {
        shortcuts.left.shortcut1 = {
          icon = "";
          tooltip = "Zen Browser";
          command = "zen-beta";
        };
        shortcuts.left.shortcut2 = {
          icon = "";
          tooltip = "File Explorer";
          command = "dolphin";
        };
      };

      theme = {
        name = "catppuccin_mocha";
        bar = {
          opacity = 80;
          outer_spacing = "0.2em";
          buttons = {
            padding_x = "0.4rem";
            padding_y = "0.0rem";
            background_opacity = 0;
          };
        };
        font = {
          size = "0.9rem";
        };
      };
    };
  };
}
