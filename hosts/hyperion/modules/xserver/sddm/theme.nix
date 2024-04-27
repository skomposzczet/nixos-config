{ pkgs }:

pkgs.stdenv.mkDerivation{
  name = "sddm-catppuccin-mocha";

  src = pkgs.fetchurl {
    url = "https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip";
    sha256 = "H7F6eWhdl+phboHAufT9AccL3Qj09cEdM9t+sLHTKZk=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    mkdir ./temp
    ${pkgs.unzip}/bin/unzip $src -d ./temp
    cp -R ./temp/catppuccin-mocha/* $out/
  '';
}
