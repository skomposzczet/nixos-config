{
  pkgs,
  ...
}: {
    home.file.".config/wallpaper/wallpaper.png".source = ./wallpapers/edgerunners.png;
    home.file.".config/wallpaper/wallpaper_blur.png".source = ./wallpapers/edgerunners_blur.png;
}
