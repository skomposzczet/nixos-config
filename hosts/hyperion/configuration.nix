{ config, pkgs, ... }:

{
  imports = [
    ../modules/xserver
    ../modules/global.nix
    ../modules/virtualisation.nix
    ../modules/media.nix
    ../modules/gpg.nix
    ../modules/ssh.nix
    ../modules/lock/default.nix
    ../modules/shell.nix
    ../modules/fonts.nix
    ../modules/packages.nix
    ../modules/ssh.nix
    ../modules/vm.nix
    ../modules/bluetooth.nix
    ../modules/users/d3rfnam.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hyperion";
  networking.networkmanager.enable = true;

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
