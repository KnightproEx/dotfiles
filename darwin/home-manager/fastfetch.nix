{ ... }:

{
  programs = {
    fastfetch = {
      enable = true;
      settings = {
        "logo" = {
          "type" = "kitty-icat";
          "height" = 15;
          "width" = 50;
          "padding" = {
            "top" = 2;
            "left" = 5;
            "right" = 5;
          };
          "position" = "left";
        };
        "display" = {
          "separator" = " ";
        };
        "modules" = [
          "break"
          {
            "type" = "custom";
            "format" = "┌─────────────Hardware─────────────┐";
            "outputColor" = "cyan";
          }
          {
            "type" = "host";
            "key" = " PC ";
            "keyColor" = "red";
          }
          {
            "type" = "cpu";
            "key" = "│ ├ ";
            "keyColor" = "red";
          }
          {
            "type" = "gpu";
            "key" = "│ ├󰒆 ";
            "keyColor" = "red";
          }
          {
            "type" = "disk";
            "key" = "│ ├ ";
            "folders" = "/";
            "format" = "{size-used} / {size-total} ({size-percentage})";
            "keyColor" = "red";
          }
          {
            "type" = "swap";
            "key" = "│ ├SW";
            "keyColor" = "red";
          }
          {
            "type" = "display";
            "key" = "│ ├ ";
            "keyColor" = "red";
            "format" = "MONITOR ({name})";
            # "format" = "MONITOR ({name}) {width}x{height} @ {refresh-rate} Hz - {physical-width}x{physical-height} mm ({inch} inches; {ppi} ppi)";
          }
          {
            "type" = "memory";
            "key" = "└ └󰍛 ";
            "keyColor" = "red";
          }
          {
            "type" = "custom";
            "format" = "└──────────────────────────────────┘";
            "outputColor" = "cyan";
          }
          {
            "type" = "custom";
            "format" = "┌─────────────Software─────────────┐";
            "outputColor" = "cyan";
          }
          {
            "type" = "os";
            "key" = "􀣺 OS ";
            "keyColor" = "green";
          }
          {
            "type" = "kernel";
            "key" = "│ ├ ";
            "keyColor" = "green";
          }
          {
            "type" = "packages";
            "key" = "│ ├󰏖 ";
            "keyColor" = "green";
          }
          {
            "type" = "localip";
            "key" = "│ ├IP";
            "keyColor" = "green";
          }
          {
            "type" = "shell";
            "key" = "└ └ ";
            "keyColor" = "green";
          }
          {
            "type" = "de";
            "key" = " DE ";
            "keyColor" = "blue";
          }
          {
            "type" = "lm";
            "key" = "│ ├ ";
            "keyColor" = "blue";
          }
          {
            "type" = "wm";
            "key" = "│ ├ ";
            "keyColor" = "blue";
          }
          {
            "key" = "│ ├ ";
            "keyColor" = "blue";
            "type" = "command";
            "text" = "pgrep yabai &> /dev/null && echo yabai || echo Quartz Compositor";
          }
          {
            "type" = "terminal";
            "key" = "│ ├ ";
            "keyColor" = "blue";
          }
          {
            "type" = "terminalfont";
            "key" = "└ └ ";
            "keyColor" = "blue";
          }
          {
            "type" = "custom";
            "format" = "└──────────────────────────────────┘";
            "outputColor" = "cyan";
          }
          {
            "type" = "custom";
            # "format"= "┌───────────Uptime / Age───────────┐";
            "format" = "┌──────────────Uptime──────────────┐";
            "outputColor" = "cyan";
          }
          # {
          #   "type"= "command";
          #   "key"= "  OS Age";
          #   "keyColor"= "magenta";
          #   "text"= "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
          # };
          {
            "type" = "uptime";
            "key" = "  Uptime";
            "keyColor" = "magenta";
          }
          {
            "type" = "custom";
            "format" = "└──────────────────────────────────┘";
            "outputColor" = "cyan";
          }
        ];
      };
    };
  };
}
