{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-color;
  };

  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.bash}/bin/bash $HOME/.config/lock/lock.sh ${pkgs.i3lock-color}/bin/i3lock-color";
  };
}
