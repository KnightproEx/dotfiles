{ config, pkgs, ... }:

{
  home = {
    username = "fmt";
    homeDirectory = "/Users/fmt";
    stateVersion = "23.05";
    packages = [ ];
    sessionVariables = { };
    sessionPath = [
      "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
    ];
    file = {
      ".zshrc".source = ~/dotfiles/zsh/.zshrc;
      ".config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh".source = ~/dotfiles/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh;
      ".config/aerospace".source = ~/dotfiles/aerospace;
      ".config/bat".source = ~/dotfiles/bat;
      ".config/nix".source = ~/dotfiles/nix;
      ".config/nvim".source = ~/dotfiles/nvim;
      ".config/p10k".source = ~/dotfiles/p10k;
      ".config/raycast".source = ~/dotfiles/raycast;
      ".config/tmux".source = ~/dotfiles/tmux;
      ".config/wezterm".source = ~/dotfiles/wezterm;
    };
  };

  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
      initExtra = ''
        export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
      '';
    };
  };
}
