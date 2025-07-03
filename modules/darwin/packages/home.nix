{pkgs, ...}:
with pkgs;
  [
    nodejs_22
    yazi
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    pre-commit
    # libxml2
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
  ++ import ../../shared/packages/home.nix {inherit pkgs;}
