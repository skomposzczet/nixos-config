{ config, pkgs, inputs, system, ... }:

{
  imports = [
    ../modules/awesomewm
    ../modules/alacritty
    ../modules/tmux.nix
    ../modules/picom
    ../modules/packages.nix
    ../modules/rofi.nix
    ../modules/theme.nix
    ../modules/git.nix
    ../modules/wezterm.nix
    ../modules/vm.nix
    ../modules/direnv.nix
    ../modules/neofetch
  ];

  home.username = "d3rfnam";
  home.homeDirectory = "/home/d3rfnam";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
