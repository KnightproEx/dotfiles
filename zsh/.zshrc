# Source global shell alias & variable files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
# [ -f "$XDG_CONFIG_HOME/shell/var" ] && source "$XDG_CONFIG_HOME/shell/var"

 export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional

# Key bindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Load modules
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Completion options
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' fzf-bindings \
  'ctrl-/:toggle-preview' \
	'ctrl-u:preview-page-up' \
  'ctrl-d:preview-page-down'
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# zstyle ':fzf-tab:*' popup-min-size 60 8
# zstyle ':fzf-tab:complete:-command-:*' popup-min-size 160 8
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:-command-:*' fzf-preview '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

# Main options
setopt appendhistory
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_verify
unsetopt prompt_sp

# History options
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
HISTDUP=erase
HISTCONTROL=ignoreboth

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init --cmd cd zsh)"

# Powerlevel10k prompt
[[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh
[ -f "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ] && source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"

# Catppuccin ZSH syntax highlighting
[ -f "$XDG_CONFIG_HOME/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" ] && source "$XDG_CONFIG_HOME/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"

# Zinit
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"
source <(carapace _carapace)
source <(fzf --zsh)
source <(switcher init zsh)
# source <(kubectl completion zsh)
# source <(helm completion zsh)
source <(switch completion zsh)
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# complete -C aws_completer aws
# complete -o nospace -C /run/current-system/sw/bin/terraform terraform
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit cdreplay -q
