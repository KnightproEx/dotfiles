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

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "25.05";
    packages = [ ];
    sessionVariables = { };

    sessionPath = [
      "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
    ];

    file = with config.lib.file; {
      ".zprofile".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.zprofile";
      ".config/shell".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/shell";
      ".config/zsh".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zsh";
      ".config/aerospace".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/aerospace";
      ".config/nvim".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
      ".config/p10k".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/p10k";
      ".config/raycast".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/raycast";
      ".config/tmux".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/tmux";
      ".config/wezterm".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm";
      ".config/ghostty".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/ghostty";
      # ".config/bat".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/bat";
      # ".config/btop".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/btop";
      # ".config/yazi/theme.toml".source =
      #   mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/yazi/theme.toml";
      # ".config/lazygit".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/lazygit";
      # ".config/k9s/skins".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/k9s/skins";
      # ".config/k9s/config.yaml".source =
      #   mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/k9s/config.yaml";
      # ".config/fastfetch".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/fastfetch";
    };
  };
}
