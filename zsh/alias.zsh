alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

alias ls="eza --icons=always"
alias cat="bat"
alias grep="grep --color=auto"
alias k="kubectl"
alias tf="terraform"
alias fman="compgen -c | fzf | xargs man"
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias sre="sudo darwin-rebuild switch --flake ~/dotfiles/darwin"
