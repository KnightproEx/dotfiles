{pkgs, ...}: {
  environment.systemPackages = with pkgs;
    [
      # python315
      clang
    ]
    ++ import ../../shared/packages/system.nix {inherit pkgs;};
}
