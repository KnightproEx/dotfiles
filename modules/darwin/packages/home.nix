{pkgs, ...}:
with pkgs;
  [
    yazi
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    pkg-config
    python310
    openjdk17
    cargo-nextest
    rustup
    bazelisk
    fvm
    httpie
    git-lfs
    pre-commit
  ]
  ++ import ../../shared/packages/home.nix {inherit pkgs;}
