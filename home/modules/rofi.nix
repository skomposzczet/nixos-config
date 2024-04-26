{
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    theme = "${pkgs.catppuccin}/rofi/catppuccin-mocha.rasi";
    plugins = [ 
      pkgs.rofi-calc
    ];
    pass.enable = true;
  };
}
