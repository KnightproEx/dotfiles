# Nix
# TODO: Run this on nixos only
# export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD ')

# XDG directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

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
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/keys"

# FZF options
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--layout reverse \
--height=60% \
--tmux=center,100%,90% \
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
command -v bat > /dev/null && export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
command -v bat > /dev/null && command -v tree > /dev/null && export FZF_DEFAULT_OPTS="$FZF_COMMON_OPTIONS"

# Path
# export PATH="$XDG_CONFIG_HOME/scripts:$PATH"

export PATH="$HOME/fvm/default/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm@16/bin:$PATH"
export CC="/opt/homebrew/opt/llvm@16/bin/clang"
export CXX="$CC++"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm@16/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/llvm@16/include"
export PATH=$PATH:$(brew --prefix)/opt/postgresql@12/bin
# export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix)/lib:$(brew --prefix)/opt/libiconv/lib
# export LDFLAGS="-L/opt/homebrew/opt/libiconv/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libiconv/include"

export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
