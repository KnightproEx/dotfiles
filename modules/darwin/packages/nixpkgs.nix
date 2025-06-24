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

      python310
      openjdk17

      cargo-nextest
    ]
    ++ import ../../shared/packages.nix {inherit pkgs;};
}
