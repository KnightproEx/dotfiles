{...}: {
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
      "awscli"
      "sevenzip"
      "borders"
    ];
    casks = [
      # Browser
      "arc"
      "zen"

      # Terminal Emulator
      "ghostty"
      # "wezterm"

      # Tool
      "aerospace"
      "raycast"
      # "utm"
      # "betterdisplay"

      # Remote Desktop
      # "anydesk"

      # Messaging
      "messenger"
      "whatsapp"
      "discord"

      # Config
      "karabiner-elements"
      "logi-options+"
      "jordanbaird-ice"
      # "qmk-toolbox"

      # Dev
      "visual-studio-code"
      # "openvpn-connect"
      "fork"
      "orbstack"
      # "postman"
      "yaak"

      # Database Client
      "tableplus"
      # "beekeeper-studio"

      # Note
      "obsidian"

      # Font
      # "font-sf-pro"
      # "font-symbols-only-nerd-font"
    ];
  };
}
