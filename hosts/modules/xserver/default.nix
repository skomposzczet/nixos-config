{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ./sddm
  ];
  services.xserver = {
    enable = true;

    windowManager.awesome = {
      package = pkgs.myAwesome;
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];

    };
  };
  services.desktopManager.gnome.enable = true;

  services.xserver = {
    xkb.layout = "pl";
    xkb.variant = "";
  };

  services.xserver.autoRepeatInterval = 40;

  services.libinput = {
    enable = true;
    touchpad = {
      clickMethod = "buttonareas";
      disableWhileTyping = true;
      tapping = true;
      naturalScrolling = true;
      tappingButtonMap = "lmr";
    };
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "modesetting"
    "fbdev"
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.autorandr = {
    enable = true;
  };

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xset}/bin/xset s off -dpms
    ${pkgs.xorg.xset}/bin/xset r rate 660 25
    ${pkgs.autorandr}/bin/autorandr --change
  '';

}
