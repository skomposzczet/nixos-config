{
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    plugins = [ 
      pkgs.rofi-calc
      pkgs.rofi-file-browser
    ];
    pass.enable = true;
  };
}
