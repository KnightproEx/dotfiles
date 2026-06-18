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
      # "nikitabobko/tap"
      "BarutSRB/tap"
    ];
    masApps = {
      Amphetamine = 937984704;
    };
    brews = [
      "mas"
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
      "tree-sitter-cli"
    ];
    casks = [
      # Browser
      "arc"
      "zen"
      "brave-browser"
      "helium-browser"

      # Terminal Emulator
      "ghostty"

      # Tool
      # "aerospace"
      "omniwm"
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
