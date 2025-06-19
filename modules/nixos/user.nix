{
  pkgs,
  user,
  ...
}: {
  users.defaultUserShell = pkgs.zsh;
  users.users.${user} = {
    isNormalUser = true;
    description = "Khong Boon Hui";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    useDefaultShell = true;
  };

  users.groups.input.members = [user];
  users.groups.uinput.members = [user];
}
