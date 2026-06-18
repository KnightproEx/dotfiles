{config, ...}: {
  sops = {
    defaultSopsFile = ../../shared/secrets/secrets.yaml;

    age.sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
    # age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "git/work/username" = {};
      "git/work/email" = {};
      "git/work/signingKey" = {};
      "git/personal/username" = {};
      "git/personal/email" = {};
      "git/personal/signingKey" = {};
    };

    # TODO: Unique signing key for each machine
    templates = {
      "git-work".content = ''
        [user]
          name = ${config.sops.placeholder."git/work/username"};
          email = ${config.sops.placeholder."git/work/email"};
          signingKey = ${config.sops.placeholder."git/work/signingKey"};
      '';
      "git-personal".content = ''
        [user]
          name = ${config.sops.placeholder."git/personal/username"};
          email = ${config.sops.placeholder."git/personal/email"};
          signingKey = ${config.sops.placeholder."git/personal/signingKey"};
      '';
    };
  };
}
