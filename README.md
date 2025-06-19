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

## Generate age key

```bash
mkdir -p ~/.config/sops/age
nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
```

## Get age public key

```bash
nix-shell -p ssh-to-age --run "ssh-to-age < ~/.ssh/id_ed25519.pub"
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
