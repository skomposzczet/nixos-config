{
inputs,
outputs,
pkgs,
...
}: {
  fonts.packages = [
    pkgs.nerd-fonts.ubuntu-mono
    pkgs.nerd-fonts.agave
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.envy-code-r
    pkgs.nerd-fonts.geist-mono
    pkgs.nerd-fonts.overpass
  ];
}
