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
  yq-go
  poppler
  unzip
  diff-so-fancy
  tlrc
  openssl
  carapace
  luarocks
  # nushell
  starship
  duf
  curl
  direnv
  devenv
  watch
  step-cli
  nix-direnv

  # Dev
  terraform
  # nodejs_24
  nodejs_22
  ansible
  lazygit
  bacon
  flyway
  dbmate
  go
  air
  sqlc
  sqlx-cli
  gh
  tigerbeetle

  # K8s
  kubectl
  kubeconform
  kubeswitch
  kubernetes-helm
  fluxcd
  argocd
  kustomize
  k9s
  linkerd
]
