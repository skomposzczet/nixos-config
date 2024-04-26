{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Rosewater-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "rosewater" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "teal";
        flavor = "mocha";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Rosewater-Cursors";
      package = pkgs.catppuccin-cursors.mochaRosewater;
      size = 16;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Rosewater-Cursors";
    package = pkgs.catppuccin-cursors.mochaRosewater;
    size = 16;
  };
}
