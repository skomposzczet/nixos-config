{ config, pkgs, ... }:

{
  imports = [
    modules/global.nix
    modules/virtualisation.nix
    modules/xserver.nix
    modules/media.nix
    modules/gpg.nix
    modules/ssh.nix
    modules/lock/default.nix
    modules/shell.nix
    modules/fonts.nix
    modules/packages.nix
    modules/ssh.nix
    modules/users/d3rfnam.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hyperion";
  networking.networkmanager.enable = true;

  swapDevices = [
    {
      device = "/dev/nvme0n1p7";
    }
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
