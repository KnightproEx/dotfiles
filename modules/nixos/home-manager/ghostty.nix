{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      window-padding-color = "background";
      window-padding-y = "4,0";
      window-decoration = false;
      cursor-style = "block";
      cursor-text = "080808";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";
      font-family = "MonoLisa";
      font-size = 12;
      font-style = "Medium";
      adjust-cell-height = "40%";
      adjust-cursor-height = "30%";
      adjust-underline-thickness = 1;
      adjust-overline-thickness = 1;
      adjust-strikethrough-thickness = 1;
    };
  };
}
