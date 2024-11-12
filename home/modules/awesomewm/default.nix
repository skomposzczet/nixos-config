{
  pkgs,
  ...
}: {
    home.file.".config/wallpaper/wallpaper.png".source = ./wallpapers/lucy.png;
    home.file.".config/wallpaper/wallpaper_blur.png".source = ./wallpapers/lucy_blur.png;
}
