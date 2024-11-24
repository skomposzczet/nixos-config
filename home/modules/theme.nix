{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 16;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "peach";
        flavor = "macchiato";
      };
    };
    theme = {
      name = "catppuccin-mocha-rosewater-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "rosewater" ];
      };
    };
    gtk3.extraConfig = {gtk-application-prefer-dark-theme = 1;};
    gtk4.extraConfig = {gtk-application-prefer-dark-theme = 1;};
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "gtk2";
  };
}
