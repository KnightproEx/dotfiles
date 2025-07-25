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
  poppler
  unzip
  diff-so-fancy
  tlrc
  openssl
  carapace

  # Dev
  # terraform
  ansible
  kubectl
  kubeconform
  kubeswitch
  kubernetes-helm
  kustomize
  k9s
  lazygit
  bacon
  dbmate
  go
  air
  sqlc

  # Utilities
  nushell
  starship
  duf
  curl
]
