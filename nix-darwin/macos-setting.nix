{ pkgs, ... }:

{
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth       sufficient     pam_tid.so
  '';

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      persistent-apps = [ ];
      persistent-others = [ ];
      wvous-br-corner = 1;
    };
    finder = {
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
    };
    NSGlobalDomain = {
      KeyRepeat = 1;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      NSWindowShouldDragOnGesture = true;
      NSAutomaticWindowAnimationsEnabled = false;
      "com.apple.sound.beep.volume" = 0.0;
    };
    CustomUserPreferences = {
      "com.apple.security.authorization" = {
        ignoreArd = true;
      };
    };
  };
}
