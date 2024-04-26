{ config, pkgs, inputs, system, ... }:

{
  imports = [
    ../modules/awesomewm
    ../modules/alacritty.nix
    ../modules/tmux.nix
    ../modules/picom.nix
    ../modules/packages.nix
    ../modules/rofi.nix
    ../modules/theme.nix
    ../modules/git.nix
  ];

  home.username = "d3rfnam";
  home.homeDirectory = "/home/d3rfnam";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
