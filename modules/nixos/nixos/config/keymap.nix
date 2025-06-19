{
  inputs,
  user,
  ...
}: {
  imports = [
    inputs.xremap-flake.nixosModules.default
  ];

  services.xremap = {
    withHypr = true;
    userName = "${user}";
    config = {
      modmap = [
        {
          name = "Global";
          remap = {
            KEY_CAPSLOCK = {
              held = "KEY_LEFTCTRL";
              alone = "KEY_ESC";
            };
          };
        }
      ];
    };
  };
}
