{
pkgs,
...
}: {
  home.file.".config/wallpaper/wallpaper.png".source = ./wallpapers/aenami.png;
  home.file.".config/wallpaper/wallpaper_blur.png".source = ./wallpapers/aenami_blur.png;

  xsession.initExtra = ''
    ${pkgs.xorg.xset}/bin/xset s off
    ${pkgs.xorg.xset}/bin/xset -dpms
    ${pkgs.xorg.xset}/bin/xset r rate 600 40
    ${pkgs.autorandr}/bin/autorandr --change
  '';
}
