{pkgs, ...}: {
  environment.systemPackages = with pkgs;
    [
      # Package Manager
      pnpm
      # bun
      # cargo

      # Utilities
      nushell
      starship
      mkalias
      yazi
      duf
      pkg-config
      curl
    ]
    ++ import ../../shared/packages.nix {inherit pkgs;};
}
