{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal Emulator
    kitty

    # Editor
    nixd
    biome
    typescript-language-server
    tailwindcss-language-server
    lua-language-server
    bash-language-server
    yaml-language-server
    dockerfile-language-server-nodejs
    python313Packages.python-lsp-server
    terraform-ls
    vscode-langservers-extracted
    emmet-ls
    helm-ls
    gopls
    rust-analyzer
    prettier # prettierd
    # eslint # eslint_d
    stylua
    tflint
    shfmt
    shellcheck
    shellharden
    nixfmt-rfc-style
    rustfmt
    alejandra

    # TUI Tool
    neovim
    tmux
    yazi
    k9s
    lazygit

    # Package Manager
    nodejs_latest
    pnpm
    # bun
    # cargo

    # Dev Tool
    terraform
    ansible
    kubeswitch
    kubernetes-helm
    bacon

    # SDK
    go
    rustc
    cmake

    # Go
    air
    sqlc

    # Database Migration Tool
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
    openvpn

    # Other
    fastfetch
    btop
    cmatrix
  ];
}
