{ config, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "git/username" = { };
      "git/email" = { };
      "git/signingKey" = { };
    };

    templates = {
      "git".content = ''
        [user]
          name = ${config.sops.placeholder."git/username"};
          email = ${config.sops.placeholder."git/email"};
          signingKey = ${config.sops.placeholder."git/signingKey"};
      '';
    };
  };
}
