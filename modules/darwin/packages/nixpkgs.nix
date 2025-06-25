{pkgs, ...}: {
  environment.systemPackages = with pkgs;
    [
      # Package Manager
      # pnpm
      # bun
      # cargo

      # Utilities
      nushell
      starship
      mkalias
      yazi
      duf
      curl

      pre-commit
      libxml2
      pkg-config
      python310
      openjdk17
      cargo-nextest
      rustup
      bazelisk
    ]
    ++ import ../../shared/packages.nix {inherit pkgs;};
}
