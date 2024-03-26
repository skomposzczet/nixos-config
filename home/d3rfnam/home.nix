{ config, pkgs, inputs, system, ... }:

{

  home.username = "d3rfnam";
  home.homeDirectory = "/home/d3rfnam";

  home.packages = with pkgs; [
    # nvim
    inputs.skomposzczet-nvim.packages.${system}.default


    # apps
    neofetch
    rofi
    gnome.gnome-tweaks
    pass
    obsidian
    qbittorrent
    
    # games
    dwarf-fortress-packages.dwarf-fortress-full

    # media
    mpv
    smplayer

    # cmd
    tmux
    zsh
    lf

    # tools
    imagemagick
    networkmanagerapplet
    pciutils
    usbutils
    sysstat

    # system call monitoring
    strace
    ltrace
    lsof

    # wm
    picom
    nitrogen
    acpi

    # archives
    zip
    unzip
    xz
  ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    #pinentryPackage = pkgs.pinentry-rofi;
    enableZshIntegration = true;
    extraConfig = ''
      pinentry-program = ${pkgs.pinentry-rofi}/bin/pinentry-rofi
    '';
  };

  programs.git = {
    enable = true;
    userName = "skomposzczet";
    userEmail = "72391558+skomposzczet@users.noreply.github.com";

    signing = {
      key = "73E2CB88A0B6EE2BC82EEFABF4061BBD70A3A446";
      signByDefault = true;
    };

    extraConfig = {
      core.askPass = true;
    };
  };

  programs.alacritty = {
    enable = true;

    settings = {
      selection.save_to_clipboard = true;

      font = {
        size = 7;
        normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
          draw_bold_text_with_bright_colors = true;
        };
      };
    };
  };
  
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
