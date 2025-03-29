{
  pkgs,
  ...
}: {
  services.picom = {
    enable = true;
    package = pkgs.picom-pijulius;
    extraArgs = ["--config $HOME/.config/picom/picom.conf"];
  };
  xdg.configFile."picom/picom.conf".source = ./picom.conf;
}
