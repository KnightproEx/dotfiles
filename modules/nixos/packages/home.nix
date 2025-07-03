{pkgs, ...}:
with pkgs;
  [
    ghostty

    discord
    hypypanel

    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
    blueman
    networkmanagerapplet
    pavucontrol
    # dbeaver-bin
    swww
    copyq
    kdePackages.dolphin
    cava
    beekeeper-studio
    awscli2

    # TODO:
    # cliphist
    wl-clipboard-rs
  ]
  ++ import ../../shared/packages/home.nix {inherit pkgs;}
