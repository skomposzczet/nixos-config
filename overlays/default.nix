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

    (final: prev: {
        myAwesome = prev.awesome.overrideAttrs (old: {
          pname = "myAwesome";
          src = prev.fetchFromGitHub {
            owner = "awesomeWM";
            repo = "awesome";
            rev = "392dbc2";
            sha256 = "sha256:093zapjm1z33sr7rp895kplw91qb8lq74qwc0x1ljz28xfsbp496";
          };
          patches = [];
          postPatch = ''
            patchShebangs tests/examples/_postprocess.lua
          '';
      });
    })
  ];
}
