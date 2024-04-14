{
  inputs,
} :
{
  nixpkgs.overlays = [
    inputs.alacritty-theme.overlays.default

    (final: prev: {
      unstable = inputs.nixpkgs-unstable.legacyPackages.${prev.system};
    })

    (final: prev: {
      catppuccin = prev.catppuccin.override {
        accent = "rosewater";
        variant = "mocha";
        themeList = [ "rofi" ];
      };
    })

    (final: prev: {
      rofi-power-menu = prev.rofi-power-menu.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          ./rofi-power-menu.patch
        ];
      });
    })
  ];
}
