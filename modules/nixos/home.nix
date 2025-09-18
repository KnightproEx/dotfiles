{
  inputs,
  config,
  pkgs,
  user,
  ...
}: {
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.05";
  home.packages = import ../nixos/packages/home.nix {inherit pkgs;};

  nixpkgs.overlays = [inputs.hyprpanel.overlay];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "beekeeper-studio-5.3.4"
    ];
  };

  fonts.fontconfig.enable = true;

  imports = [
    inputs.sops-nix.homeManagerModules.sops
    inputs.zen-browser.homeModules.default
    ../../modules/nixos/home-manager
  ];

  xdg.enable = true;

  programs.home-manager.enable = true;

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      # find more options here: https://mozilla.github.io/policy-templates/
    };
  };

  home.file = with config.lib.file; {
    ".zshenv".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/.zshenv";
    ".config/zsh".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/zsh";
    ".config/nvim".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/nvim";
    ".config/p10k".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/p10k";
    ".config/tmux".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/tmux";
    ".config/kitty".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/kitty";
    ".config/hypr/hyprland.conf".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/nixos/hypr/hyprland.conf";
    ".config/hypr/scripts".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/nixos/hypr/scripts";
    ".config/yazi/theme.toml".source =
      mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/yazi/theme.toml";
    ".config/fastfetch/images".source =
      mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/shared/fastfetch/images";
  };
}
