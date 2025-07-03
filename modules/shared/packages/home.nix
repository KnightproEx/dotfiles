{pkgs}:
with pkgs; [
  nerd-fonts.jetbrains-mono

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
  # terraform
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

  # Utilities
  nushell
  starship
  duf
  curl
]
