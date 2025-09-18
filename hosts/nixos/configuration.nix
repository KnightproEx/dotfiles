{
  pkgs,
  inputs,
  user,
  hostname,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    ../../modules/nixos/packages/system.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/bootloader.nix
    ../../modules/nixos/hardware-configuration.nix
    ../../modules/nixos/nixos
  ];

  security.pam.services.swaylock = {};

  nix.settings.experimental-features = ["nix-command flakes"];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = hostname;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.upower.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # services.udev.extraRules = ''
  #   KERNEL=="uinput", GROUP="input", TAG+="uaccess"
  # '';

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  home-manager = {
    backupFileExtension = "bak";
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit user;
    };
    users.${user} = import ../../modules/nixos/home.nix;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      UseDns = true;
      PasswordAuthentication = true;
      AllowUsers = ["bh"];
      PermitRootLogin = "no";
    };
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05";
}
