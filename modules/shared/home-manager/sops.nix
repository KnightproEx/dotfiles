{config, ...}: {
  sops = {
    defaultSopsFile = ../../shared/secrets/secrets.yaml;

    age.sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
    # age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "git/username" = {};
      "git/email" = {};
      "git/signingKey" = {};
    };

    # TODO: Unique signing key for each machine
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
