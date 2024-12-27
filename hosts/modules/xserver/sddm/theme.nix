{ pkgs }:

pkgs.stdenv.mkDerivation{
  name = "sddm-catppuccin-macchiato";

  src = pkgs.fetchurl {
    url = "https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-macchiato.zip";
    sha256 = "SkMDTf4TGVYy/qgkPT9zLCpYBreFeuExuiug2npyBPo=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    mkdir ./temp
    ${pkgs.unzip}/bin/unzip $src -d ./temp
    cp -R ./temp/catppuccin-macchiato/* $out/
    echo "QtVersion=6" | tee -a $out/share/sddm/themes/catppuccin-*/metadata.desktop
  '';
}
