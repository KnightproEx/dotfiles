{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    history = {
      path = "${config.xdg.stateHome}/zsh/history"; # Relocates history file
      size = 1000000;
    };

    # Optional: Manage plugins or extra init commands
    initExtra = ''
      # Custom zsh logic here
    '';
  };
}
