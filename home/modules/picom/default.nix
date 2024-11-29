{
  pkgs,
  ...
}: {
  services.picom = {
    enable = true;
    package = pkgs.picom-pijulius;
    settings = {
      animations = true;
      animation-stiffness = 300.0;
      animation-dampening = 35.0;
      animation-clamping = false;
      animation-mass = 1;
      animation-for-open-window = "fly-in";
      animation-for-unmap-window = "zoom";
      animation-for-menu-window = "slide-down";
      animation-for-transient-window = "slide-down";
      animation-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "window_type = 'tooltip'"
      ];

      shadow = false;
      shadow-radius = 10;
      shadow-offset-x = -7;
      shadow-offset-y = -7;
      shadow-exclude = [
        "name = 'Notification'"
        "class_g = 'Conky'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Cairo-clock'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      fading = true;
      fade-in-step = 0.03;
      fade-out-step = 0.03;

      inactive-opacity = 0.9;
      frame-opacity = 1.0;
      inactive-opacity-override = false;
      focus-exclude = [ "class_g = 'Cairo-clock'" ];
      opacity-rule = [
        "90:class_g = 'org.wezfurlong.wezterm' && focused"
        "100:class_g = 'Rofi'"
      ];

      corner-radius = 9;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];

      blur-kern = "3x3box";
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      backend = "glx";
      vsync = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      detect-client-leader = true;
      use-damage = false;
      log-level = "warn";
      wintypes = 
      {
        tooltip = { fade = true; shadow = false; opacity = 1.0; focus = true; full-shadow = false; };
        dock = { shadow = false; clip-shadow-above = true; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 1.0; };
        dropdown_menu = { opacity = 1.0; };
      };
    };
  };
}
