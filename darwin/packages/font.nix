{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # (nerdfonts.override { fonts = [ "Hack" ]; })
    sketchybar-app-font
  ];
}
