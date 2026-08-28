{...}: {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      # upgrade = true;
    };
    taps = [
      {
        name = "felixkratz/formulae";
        trusted = true;
      }
      {
        name = "nikitabobko/tap";
        trusted = true;
      }
      # {
      #   name = "BarutSRB/tap";
      #   trusted = true;
      # }
      # {
      #   name = "Sikarugir-App/sikarugir";
      #   trusted = true;
      # }
    ];
    brews = [
      # "mas"
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
      # "brave-browser"
      "helium-browser"

      # Terminal Emulator
      "ghostty"

      # Tool
      "aerospace"
      "raycast"
      "vorssaint"
      # "omniwm"
      # "utm"
      # "betterdisplay"
      # "sikarugir"

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
