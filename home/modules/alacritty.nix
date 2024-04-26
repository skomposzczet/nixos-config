{
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;

    settings = {
      import = [ pkgs.alacritty-theme.catppuccin_mocha ];
      selection.save_to_clipboard = true;

      font = {
        size = 7;
        normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
          draw_bold_text_with_bright_colors = true;
        };
      };
    };
  };
}
