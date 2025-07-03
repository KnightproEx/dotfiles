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

      (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
      pre-commit
      libxml2
      pkg-config
      python310
      openjdk17
      cargo-nextest
      rustup
      bazelisk
      fvm
      httpie
      git-lfs
      kustomize
      pre-commit
    ]
    ++ import ../../shared/packages.nix {inherit pkgs;};
}
