{
  self,
  pkgs,
  config,
  platform,
  username,
  hostname,
  ...
}: {
  imports = [
    ./packages
    ./configuration/nix.nix
    ./configuration/macos.nix
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = platform;
  };

  system = {
    primaryUser = username;
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    activationScripts.application.text = let
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
  };
}
