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
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];

    };

    desktopManager.gnome.enable = true;
  };

  services.xserver = {
    layout = "pl";
    xkbVariant = "";
  };

  services.xserver.libinput = {
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
}
