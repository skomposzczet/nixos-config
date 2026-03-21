{
inputs,
outputs,
pkgs,
...
}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "UbuntuMono" "Agave" "FiraCode" "EnvyCodeR" "GeistMono" "Overpass" ]; })
  ];
}
