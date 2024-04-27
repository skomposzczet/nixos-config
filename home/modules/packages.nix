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
    gnome.nautilus
    
    # games
    dwarf-fortress-packages.dwarf-fortress-full

    # media
    mpv
    smplayer
    gedit
    evince
    loupe
    amberol

    # cmd
    zsh
    lf

    # tools
    imagemagick
    networkmanagerapplet
    pciutils
    usbutils
    sysstat
    tree

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
