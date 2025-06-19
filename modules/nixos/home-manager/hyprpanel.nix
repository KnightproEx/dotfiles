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
            middle = ["media"];
            right = ["volume" "systray" "clock" "battery" "notifications"];
          };
        };
      };

      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;
      bar.clock.format = "%a %b %d  %I:%M %p";

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;

      theme = {
        name = "catppuccin_mocha";
        bar = {
          opacity = 80;
          outer_spacing = "0.2em";
        };
        font = {
          size = "0.9rem";
        };
      };
    };
  };
}
