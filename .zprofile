# XDG directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR=nvim

# Move config files for XDG compliance
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export K9S_CONFIG_DIR="$XDG_CONFIG_HOME/k9s"
export LESSHISTFILE="$XDG_CONFIG_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/keys"

# FZF options
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
export FZF_COMMON_OPTIONS="
$FZF_DEFAULT_OPTS \
--bind='ctrl-/:toggle-preview'
--bind='ctrl-u:preview-page-up'
--bind='ctrl-d:preview-page-down'
--preview '([[ -d {} ]] && tree -C {}) || ([[ -f {} ]] && bat --style=full --color=always {}) || echo {}'"
command -v fd > /dev/null && export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
command -v fd > /dev/null && export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
command -v fd > /dev/null && export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
command -v bat > /dev/null && export BAT_THEME=Catppuccin-Mocha
command -v bat > /dev/null && export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
command -v bat > /dev/null && command -v tree > /dev/null && export FZF_DEFAULT_OPTS="$FZF_COMMON_OPTIONS"

# export PATH="$XDG_CONFIG_HOME/scripts:$PATH"
# export PATH=$PATH:/run/current-system/sw/bin

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

# Flutter
export PATH=$HOME/Library/Flutter/bin:$PATH

# Composer
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.config/herd-lite/bin:$PATH

# PHP
export PATH=$PATH:/opt/homebrew/opt/php@8.3/bin
export PATH=$PATH:/opt/homebrew/opt/php@8.3/sbin
export PHP_INI_SCAN_DIR=$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR
