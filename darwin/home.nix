{
  config,
  username,
  inputs,
  ...
}:

{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./home-manager
  ];

  xdg.enable = true;

  programs.home-manager.enable = true;

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "25.11";
    packages = [ ];
    sessionVariables = { };

    sessionPath = [
      "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
    ];

    file = with config.lib.file; {
      ".zshenv".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.zshenv";
      ".config/zsh".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zsh";
      ".config/aerospace".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/aerospace";
      ".config/nvim".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
      ".config/p10k".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/p10k";
      ".config/tmux".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/tmux";
      ".config/wezterm".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm";
      ".config/ghostty".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/ghostty";
      ".config/yazi/theme.toml".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/yazi/theme.toml";
      ".config/fastfetch/images".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/fastfetch/images";
      ".config/nushell/catppuccin_mocha.nu".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nushell/catppuccin_mocha.nu";
      ".config/nushell/config.nu".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nushell/config.nu";
      ".config/nushell/env.nu".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nushell/env.nu";
      ".config/starship/starship.toml".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/starship/starship.toml";
    };
  };
}
