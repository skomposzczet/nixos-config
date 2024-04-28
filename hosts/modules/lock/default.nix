{
  inputs,
  outputs,
  pkgs,
  ...
}: 
let
  nix-i3-lock = (import ./lock-script.nix { inherit pkgs; });
in {
  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-color;
  };

  programs.xss-lock = {
    enable = true;
    lockerCommand = "${nix-i3-lock}/bin/nix-i3-lock";
  };
}
