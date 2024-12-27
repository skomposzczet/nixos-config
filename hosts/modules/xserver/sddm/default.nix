{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners
  ];

  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "catppuccin-sddm-corners";
    defaultSession = "none+awesome";
  };
}
