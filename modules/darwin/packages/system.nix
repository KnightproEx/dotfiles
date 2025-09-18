{pkgs, ...}: {
  environment.systemPackages = with pkgs;
    [
      # python310
      clang
    ]
    ++ import ../../shared/packages/system.nix {inherit pkgs;};
}
