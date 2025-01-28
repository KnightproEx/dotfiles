{
  self,
  pkgs,
  config,
  username,
  ...
}:

{
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth       sufficient     pam_tid.so
  '';

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

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  home-manager.backupFileExtension = "backup";

  nix = {
    configureBuildUsers = true;
    useDaemon = true;
    # settings.auto-optimise-store = true;
    # optimise.automatic = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };
}
