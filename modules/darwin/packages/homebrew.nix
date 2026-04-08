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
      # "borders"

      # Networking
      "mtr"

      # Work
      "libxmlsec1"
      "librdkafka"
      "llvm@16"
      "openjdk@17"
      "postgresql@17"
      "libiconv"
      "protobuf"
      "podman"
    ];
    casks = [
      # Browser
      "arc"
      "zen"

      # Terminal Emulator
      "ghostty"

      # Tool
      "aerospace"
      "raycast"
      # "utm"
      # "betterdisplay"

      # Remote Desktop
      # "anydesk"

      # Messaging
      "whatsapp"
      "discord"

      # Config
      "karabiner-elements"
      "logi-options+"
      "jordanbaird-ice"
      # "qmk-toolbox"

      # Dev
      "visual-studio-code"
      "android-studio"
      "fork"
      "orbstack"
      "postman"
      "yaak"
      # "openvpn-connect"

      # Database Client
      "tableplus"

      # LaTeX
      "mactex"

      # Note
      "obsidian"

      # Font
      # "font-sf-pro"
      # "font-symbols-only-nerd-font"
    ];
  };
}
