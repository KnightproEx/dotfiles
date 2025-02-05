{
  self,
  pkgs,
  config,
  platform,
  ...
}:

{
  services.nix-daemon.enable = true;

  nix = {
    configureBuildUsers = true;
    useDaemon = true;
    optimise.automatic = true;

    gc = {
      automatic = true;
      interval = [
        {
          Hour = 3;
          Minute = 0;
        }
      ];
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = platform;
  };

  system = {
    activationScripts.application.text =
      let
        env = pkgs.build.Env {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
      pkgs.lib.mkForce ''
        echo "setting up /Applications..." >&2
        rm -rf /Application/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';

    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 5;
  };
}
