{
  self,
  inputs,
  pkgs,
  config,
  system,
  user,
  hostname,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    ../../modules/darwin/packages
    ../../modules/darwin/configuration/nix.nix
    ../../modules/darwin/configuration/macos.nix
  ];

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs user;};
    users.${user} = import ../../modules/darwin/home.nix;
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = user;
  };

  networking.hostName = hostname;

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = system;
  };

  system = {
    primaryUser = user;
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
