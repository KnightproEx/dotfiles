{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # TUI
    neovim
    tmux
    yazi

    # Package Manager
    nodejs
    pnpm
    bun
    cargo

    # Compiler
    rustc

    # Dev Tool
    terraform
    packer
    kubeswitch
    kubernetes-helm
    bacon
    k9s
    lazygit

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
    qmk
    ffmpeg
    imagemagick
    fastfetch
    jq
    poppler

    # LSP
    nixd

    # Formatter
    nixfmt-rfc-style
    rustfmt
  ];

  homebrew = {
    enable = true;
    taps = [
      "felixkratz/formulae"
      "nikitabobko/tap"
    ];
    brews = [
      "nginx"
      "awscli"
      "php"
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
      # "sketchybar"

      # Messaging
      "messenger"
      "whatsapp"
      "discord"

      # Config
      "qmk-toolbox"
      "karabiner-elements"
      "logi-options+"
      "displaylink"

      # Dev
      "visual-studio-code"
      "openvpn-connect"
      "sourcetree"
      "mysqlworkbench"
      "orbstack"
      "postman"

      # Font
      "font-sf-pro"
      "font-symbols-only-nerd-font"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  fonts.packages = with pkgs; [
    # (nerdfonts.override { fonts = [ "Hack" ]; })
    sketchybar-app-font
  ];
}
