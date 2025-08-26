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

      # Work
      "libxmlsec1"
      "librdkafka"
      "llvm@16"
      "postgresql@12"
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
      "playcover-community"

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
      "android-studio"
      "fork"
      "orbstack"
      "postman"
      "yaak"
      # "openvpn-connect"

      # Database Client
      "tableplus"

      # Font
      # "font-sf-pro"
      # "font-symbols-only-nerd-font"
    ];
  };
}
