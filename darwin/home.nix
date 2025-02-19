{ config, username, ... }:

{
  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "23.05";
    packages = [ ];
    sessionVariables = { };

    sessionPath = [
      "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
    ];

    file = with config.lib.file; {
      ".zshrc".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zsh/.zshrc";
      ".config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      ".config/aerospace".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/aerospace";
      ".config/bat".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/bat";
      ".config/btop".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/btop";
      ".config/nvim".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
      ".config/p10k".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/p10k";
      ".config/raycast".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/raycast";
      ".config/tmux".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/tmux";
      ".config/wezterm".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm";
      ".config/ghostty".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/ghostty";
      ".config/yazi".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/yazi";
      ".config/lazygit".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/lazygit";
      ".config/k9s".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/k9s";
    };
  };

  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
      initExtra = ''
        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
      '';
    };
  };
}
