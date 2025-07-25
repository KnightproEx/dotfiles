{inputs, ...}: {
  nix = {
    optimise.automatic = true;

    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    # gc = {
    #   automatic = true;
    #   interval = [
    #     {
    #       Hour = 3;
    #       Minute = 0;
    #     }
    #   ];
    #   options = "--delete-older-than 7d";
    # };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      download-buffer-size = 524288000;
    };
  };
}
