{
pkgs,
...
}: {
  home.file.".config/wallpaper/wallpaper.png".source = ./wallpapers/aenami.png;
  home.file.".config/wallpaper/wallpaper_blur.png".source = ./wallpapers/aenami_blur.png;
}
