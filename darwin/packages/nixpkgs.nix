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

    # Go
    air
    sqlc

    # Database Migration Tools
    dbmate

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
    jq
    poppler
    diff-so-fancy
    duf
    openssl
    pkg-config
    curl
    qmk
    tlrc

    # Compile
    cmake

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
