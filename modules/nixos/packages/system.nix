{
  inputs,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;
  programs.zsh.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  environment.shells = with pkgs; [zsh];

  environment.systemPackages = with pkgs;
    [
      inputs.yazi.packages.${system}.default

      # Wayland
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      }))
      # eww

      # dunst
      # libnotify

      # hyprpaper

      # pnpm
      # bun
      # cargo
      # python314

      # Dev Tool
    ]
    ++ import ../../shared/packages/system.nix {inherit pkgs;};
}
