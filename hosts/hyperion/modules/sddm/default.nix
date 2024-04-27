{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  services.xserver.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./theme.nix { inherit pkgs; }}";
    defaultSession = "none+awesome";
  };
}
