{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # nvim
    inputs.skomposzczet-nvim.packages.${system}.default

    # apps
    neofetch
    gnome.gnome-tweaks
    pass
    obsidian
    qbittorrent
    calibre
    planify
    
    # games
    dwarf-fortress-packages.dwarf-fortress-full

    # media
    mpv
    smplayer

    # cmd
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
    acpi
    rofi-power-menu
    gscreenshot

    # archives
    zip
    unzip
    xz
  ];
}
