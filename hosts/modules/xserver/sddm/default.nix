{
inputs,
outputs,
pkgs,
...
}: {
  services.displayManager.defaultSession = "none+awesome";

  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "mauve";
      font  = "Noto Sans";
      fontSize = "9";
      loginBackground = true;
    }
  )];

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-macchiato-mauve";
    package = pkgs.kdePackages.sddm;
  };
}
