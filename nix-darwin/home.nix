{ config, pkgs, ... }:

{
  home = {
    username = "bh";
    homeDirectory = "/Users/bh";
    stateVersion = "23.05";
    packages = [ ];
    sessionVariables = { };
    sessionPath = [
      "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
    ];
    file = with config.lib.file; {
      ".zshrc".source = mkOutOfStoreSymlink ~/dotfiles/zsh/.zshrc;
      ".config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh".source =
        mkOutOfStoreSymlink ~/dotfiles/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh;
      ".config/aerospace".source = mkOutOfStoreSymlink ~/dotfiles/aerospace;
      ".config/bat".source = mkOutOfStoreSymlink ~/dotfiles/bat;
      ".config/nix".source = mkOutOfStoreSymlink ~/dotfiles/nix;
      ".config/nvim".source = mkOutOfStoreSymlink ~/dotfiles/nvim;
      ".config/p10k".source = mkOutOfStoreSymlink ~/dotfiles/p10k;
      ".config/raycast".source = mkOutOfStoreSymlink ~/dotfiles/raycast;
      ".config/tmux".source = mkOutOfStoreSymlink ~/dotfiles/tmux;
      ".config/wezterm".source = mkOutOfStoreSymlink ~/dotfiles/wezterm;
      ".config/ghostty".source = mkOutOfStoreSymlink ~/dotfiles/ghostty;
      ".config/sketchybar".source = mkOutOfStoreSymlink ~/dotfiles/sketchybar;
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
