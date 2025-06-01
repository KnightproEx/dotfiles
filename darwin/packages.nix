{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # (nerdfonts.override { fonts = [ "Hack" ]; })
    sketchybar-app-font
  ];

  environment.systemPackages = with pkgs; [
    # TUI
    neovim
    tmux
    yazi
    k9s
    lazygit

    # Package Manager
    nodejs_24
    pnpm
    bun
    cargo

    # Dev Tool
    terraform
    ansible
    packer
    kubeswitch
    kubernetes-helm
    bacon
    openvpn

    # SDK
    go
    rustc

    # Go Tools
    air
    sqlc

    # Database Migration Tools
    dbmate

    # Monitoring Tool
    btop

    # Utilities
    bat
    fd
    fzf
    eza
    zoxide
    tree
    ripgrep
    mkalias
    ffmpeg
    imagemagick
    fastfetch
    jq
    poppler
    diff-so-fancy
    gnupg
    duf
    openssl
    cmake
    pkg-config
    curl
    qmk
    tlrc

    # LSP
    nixd

    # Formatter
    nixfmt-rfc-style
    rustfmt
  ];

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
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
      "zen-browser"

      # Terminal Emulator
      "ghostty"
      "wezterm"

      # Tool
      "aerospace"
      "raycast"
      "marta"
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

      # Font
      # "font-sf-pro"
      # "font-symbols-only-nerd-font"
    ];
  };
}
