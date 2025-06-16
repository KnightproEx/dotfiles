# Dotfiles

My dotfile repository

## Setup Guide

My setup cheatsheet

## Install Nix

### Official

```bash
sh <(curl -L https://nixos.org/nix/install)
```

## Git Clone without Git

```bash
nix-shell -p git --run 'git clone https://github.com/KnightproEx/dotfiles.git ~/dotfiles'
```

## Rebuild Command

### Without nix-darwin

```bash
sudo nix run nix-darwin --extra-experimental-features 'nix-command flakes' -- switch --flakes ~/dotfiles/darwin
```

### With nix-darwin

```bash
sudo darwin-rebuild switch --flake ~/dotfiles/darwin
```
