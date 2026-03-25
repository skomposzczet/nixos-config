{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # nvim
    inputs.skomposzczet-nvim.packages.${system}.default

    # apps
    pass
    obsidian
    qbittorrent
    calibre
    libreoffice-qt
    discord
    
    # games
    # TODO
    # dwarf-fortress-packages.dwarf-fortress-full

    # media
    nautilus
    pcmanfm 
    mpv
    smplayer
    gnome-text-editor
    evince
    loupe
    amberol

    # cmd
    zsh
    lf
    fzf

    # tools
    imagemagickBig
    gimp
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
    acpi
    rofi-power-menu
    gscreenshot

    # archives
    zip
    unzip
    xz
  ];
}
