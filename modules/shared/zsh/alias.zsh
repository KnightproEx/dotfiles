alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

alias ls="eza --icons=always"
alias cat="bat"
alias grep="grep --color=auto"
alias fman="compgen -c | fzf | xargs man"
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias lg="lazygit"
alias k="kubectl"
alias tf="terraform"

sre() { 
  HARDWARE_PLATFORM=$(uname -m)
  OS_NAME=$(uname -s)

  case "$OS_NAME" in
      Linux*)
          echo "Running on Linux"
          OS="linux"
          ;;
      Darwin*)
          echo "Running on macOS"
          OS="darwin"
          ;;
  esac

  case "$HARDWARE_PLATFORM" in
      x86_64)
          echo "Running on a 64-bit Intel/AMD architecture"
          ARCH="x86_64"
          ;;
      arm64|armv7l|aarch64)
          echo "Running on an ARM-based architecture"
          ARCH="aarch64"
          ;;
      *)
  esac

  DEFAULT="$ARCH-$OS"

  if [[ $OS == "linux" ]] then
    sudo nixos-rebuild switch --flake ~/dotfiles#${1:-$DEFAULT}
  elif [[ $OS == "darwin" ]] then
    sudo darwin-rebuild switch --flake ~/dotfiles#${1:-$DEFAULT}
  else
    echo "USAGE: sre <nixos|darwin>"
  fi
}

alias gauth="echo 'gcloud auth login' && gcloud auth login && echo 'gcloud auth application-default login' && gcloud auth application-default login"
alias pauth="gcloud auth print-access-token | podman login asia-docker.pkg.dev -u oauth2accesstoken --password-stdin && gcloud auth print-access-token | podman login gcr.io -u oauth2accesstoken --password-stdin"

bastion() {
  ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand='gcloud compute start-iap-tunnel bastion-mysstg-vpc-zone-name 22 --project=bigpay-ppc-mysstg05-id --zone=asia-southeast1-a --listen-on-stdin' -A boonhui_khong_bigpayme_com@jumpoff
}
