{
  pkgs,
  inputs,
  ...
}: {

  home.packages = with pkgs; [
    neofetch
  ];

  home.file.".config/neofetch" = {
    source = ./neofetch;
    recursive = true;
  };
}
