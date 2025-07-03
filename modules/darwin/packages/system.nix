{pkgs, ...}: {
  environment.systemPackages = with pkgs;
    [
      # python310
    ]
    ++ import ../../shared/packages/system.nix {inherit pkgs;};
}
