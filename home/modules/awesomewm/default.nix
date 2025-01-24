{
  pkgs,
  ...
}: {
    home.file.".config/wallpaper/wallpaper.png".source = ./wallpapers/blue_rose.png;
    home.file.".config/wallpaper/wallpaper_blur.png".source = ./wallpapers/blue_rose_blur.png;
}
