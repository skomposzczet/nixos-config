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
            rev = "41473c05ed9e85de66ffb805d872f2737c0458b6";
            sha256 = "sha256-dGceJ5cAxDSUPCqXYAZgzEeC9hd7GQMYPex7nCZ8SEg";
          };
          patches = [];
          cmakeFlags = (old.cmakeFlags or []) ++ ["-DCMAKE_POLICY_VERSION_MINIMUM=3.5"];
          postPatch = ''
            patchShebangs tests/examples/_postprocess.lua
          '';
      });
    })
  ];
}
