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
alias sre="sudo nixos-rebuild switch --flake ~/dotfiles#x86_64-linux"
alias dsre="sudo darwin-rebuild switch --flake ~/dotfiles#aarch64-darwin"
