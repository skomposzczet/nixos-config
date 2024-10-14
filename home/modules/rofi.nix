{
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    theme = "${pkgs.catppuccin}/rofi/catppuccin-mocha.rasi";
    plugins = [ 
      pkgs.rofi-calc
      pkgs.rofi-file-browser
    ];
    pass.enable = true;
  };
}
