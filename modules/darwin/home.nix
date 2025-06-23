{
  config,
  user,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./home-manager
  ];

  xdg.enable = true;

  programs.home-manager.enable = true;

  home = {
    username = user;
    homeDirectory = "/Users/${user}";
    stateVersion = "25.11";
    packages = [];
    sessionVariables = {};

    sessionPath = [
      "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
    ];

    file = with config.lib.file; {
      ".zshenv".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/.zshenv";
      ".config/zsh".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/zsh";
      ".config/aerospace".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/darwin/aerospace";
      ".config/nvim".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/nvim";
      ".config/p10k".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/p10k";
      ".config/tmux".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/tmux";
      ".config/kitty".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/kitty";
      # ".config/wezterm".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/wezterm";
      ".config/ghostty".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/darwin/ghostty";
      ".config/yazi/theme.toml".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/yazi/theme.toml";
      ".config/fastfetch/images".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/fastfetch/images";
      ".config/karabiner/assets/complex_modifications".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/darwin/karabiner/assets/complex_modifications";
      ".config/karabiner/karabiner.json".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/darwin/karabiner/karabiner.json";
      ".config/nushell/catppuccin_mocha.nu".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/nushell/catppuccin_mocha.nu";
      ".config/nushell/config.nu".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/nushell/config.nu";
      ".config/nushell/env.nu".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/nushell/env.nu";
      ".config/starship/starship.toml".source =
        mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/starship/starship.toml";
    };
  };
}
