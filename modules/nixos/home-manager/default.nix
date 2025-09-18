{...}: {
  imports = [
    ./dunst.nix
    ./ghostty.nix
    ./fastfetch.nix
    ./cava.nix
    ./waybar
    ./hypridle.nix
    ./hyprpanel.nix
    ./hyprlock.nix
    ./wlogout.nix
    ./swaylock.nix
    ./rofi
    ../../shared/home-manager
  ];
}
