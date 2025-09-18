{pkgs}:
with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.symbols-only

  # Terminal
  kitty
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
  yq
  poppler
  unzip
  diff-so-fancy
  tlrc
  openssl
  carapace
  tree-sitter
  luarocks
  nushell
  starship
  duf
  curl
  direnv

  # Dev
  # terraform
  # nodejs_24
  nodejs_22
  ansible
  lazygit
  bacon
  dbmate
  go
  air
  sqlc
  gh

  # K8s
  kubectl
  kubeconform
  kubeswitch
  kubernetes-helm
  fluxcd
  kustomize
  k9s
]
