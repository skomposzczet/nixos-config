{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # nvim
    inputs.skomposzczet-nvim.packages.${system}.default

    # apps
    gnome.gnome-tweaks
    pass
    obsidian
    qbittorrent
    calibre
    planify
    gnome.nautilus
    gnome.eog
    
    # games
    dwarf-fortress-packages.dwarf-fortress-full

    # media
    mpv
    smplayer
    gnome-text-editor
    evince
    loupe
    amberol

    # cmd
    zsh
    lf

    # tools
    imagemagick
    pciutils
    usbutils
    sysstat
    tree
    ripgrep

    # system call monitoring
    strace
    ltrace
    lsof

    # wm
    networkmanagerapplet
    volctl
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
