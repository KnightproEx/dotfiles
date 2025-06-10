{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      # autoUpdate = true;
      # upgrade = true;
    };
    taps = [
      "felixkratz/formulae"
      "nikitabobko/tap"
    ];
    brews = [
      "nginx"
      "awscli"
      "php@8.3"
      "composer"
      "sevenzip"
      "borders"
    ];
    casks = [
      # Browser
      "arc"
      "zen"

      # Terminal Emulator
      "ghostty"
      "wezterm"

      # Tool
      "aerospace"
      "raycast"
      "utm"
      # "betterdisplay"

      # Remote Desktop
      "anydesk"

      # Messaging
      "messenger"
      "whatsapp"
      "discord"

      # Config
      "qmk-toolbox"
      "karabiner-elements"
      "logi-options+"
      "jordanbaird-ice"

      # Dev
      "visual-studio-code"
      "openvpn-connect"
      "fork"
      "orbstack"
      "android-studio"
      "postman"
      "yaak"

      # Database Client
      "tableplus"
      "beekeeper-studio"

      # Note
      "obsidian"

      # Font
      # "font-sf-pro"
      # "font-symbols-only-nerd-font"
    ];
  };
}
