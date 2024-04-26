{ config, pkgs, inputs, system, ... }:

{
  home.username = "d3rfnam";
  home.homeDirectory = "/home/d3rfnam";

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

  # services.gpg-agent = {
  #   enable = true;
  #   enableSshSupport = true;
  #   #pinentryPackage = pkgs.pinentry-rofi;
  #   enableZshIntegration = true;
  #   extraConfig = ''
  #     pinentry-program = ${pkgs.pinentry-rofi}/bin/pinentry
  #   '';
  # };

  programs.rofi = {
    enable = true;
    theme = "${pkgs.catppuccin}/rofi/catppuccin-mocha.rasi";
    plugins = [ 
      pkgs.rofi-calc
    ];
    pass.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "skomposzczet";
    userEmail = "72391558+skomposzczet@users.noreply.github.com";

    signing = {
      key = "73E2CB88A0B6EE2BC82EEFABF4061BBD70A3A446";
      signByDefault = true;
    };
  };

  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;

    settings = {
      import = [ pkgs.alacritty-theme.catppuccin_mocha ];
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

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = /* tmux */ ''
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
    plugins = with pkgs; [ 
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
      {
        plugin = tmuxPlugins.yank;
      }
      {
        plugin = tmuxPlugins.sensible;
      }
    ];
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    settings = {
      detect-trasient = true;
      detect-client-leader = true;
      xrender-sync-fence = true;
      refresh-rate = 75;
    };

    shadow = false;

    activeOpacity = 1.0;
    inactiveOpacity = 0.9;
    opacityRules = [
      "90:class_g = 'Alacritty' && focused"
      "60:class_g = 'Alacritty' && !focused"
    ];

    settings = {
      frame-opacity = 0.8;
      inactive-opacity-override = false;
      corner-radius = 8;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Rosewater-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "rosewater" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "teal";
        flavor = "mocha";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Rosewater-Cursors";
      package = pkgs.catppuccin-cursors.mochaRosewater;
      size = 16;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Rosewater-Cursors";
    package = pkgs.catppuccin-cursors.mochaRosewater;
    size = 16;
  };
  
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
