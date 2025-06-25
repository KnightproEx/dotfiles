{pkgs}:
with pkgs; [
  # Terminal
  kitty
  tmux
  cmatrix
  btop
  fastfetch

  # Utilities
  git
  wget
  bat
  fd
  fzf
  eza
  zoxide
  tree
  ripgrep
  ffmpeg
  imagemagick
  jq
  poppler
  unzip
  diff-so-fancy
  tlrc
  openssl
  carapace

  # Dev
  terraform
  ansible
  kubectl
  kubeswitch
  kubernetes-helm
  k9s
  lazygit
  bacon
  dbmate
  go
  air
  sqlc
  # nodejs_latest
  nodejs_22

  # Compiler
  gcc
  cmake
  gnumake
  rustc
  clangStdenv
  clang

  # Privacy
  gnupg
  age
  sops
  openvpn

  # Editor
  neovim
  vscode
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
  alejandra
  rustfmt
]
