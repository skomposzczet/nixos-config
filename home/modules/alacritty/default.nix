{
  pkgs,
  ...
}: {
  home.file.".config/alacritty/alacritty.toml".source = ./alacritty.toml;

  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;

    # settings = {
    #   import = [ pkgs.alacritty-theme.catppuccin_mocha ];
    #   selection.save_to_clipboard = true;
    #
    #   font = {
    #     size = 12;
    #     normal = {
    #       family = "UbuntuMono Nerd Font";
    #       style = "Regular";
    #     };
    #   };
    #   
    #   env = {
    #     WINIT_X11_SCALE_FACTOR = "1";
    #   };
    # };
  };
}

