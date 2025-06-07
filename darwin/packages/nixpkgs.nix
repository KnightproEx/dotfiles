{ pkgs, ... }:

{
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
    cmake

    # Go
    air
    sqlc

    # Database Migration Tools
    dbmate

    # Utilities
    nushell
    starship
    carapace
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
    jq
    poppler
    diff-so-fancy
    duf
    openssl
    pkg-config
    curl
    wget
    wget2
    qmk
    tlrc

    # Privacy
    gnupg
    age
    sops

    # LSP
    nixd

    # Formatter
    nixfmt-rfc-style
    rustfmt

    # Other
    fastfetch
    btop
    cmatrix
  ];
}
