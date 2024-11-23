{
  pkgs,
  ...
}: {
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    settings = {
      detect-trasient = true;
      detect-client-leader = true;
      xrender-sync-fence = true;
    };

    shadow = false;

    activeOpacity = 1.0;
    inactiveOpacity = 0.9;
    opacityRules = [
      "90:class_g = 'Alacritty' && focused"
      "60:class_g = 'Alacritty' && !focused"
      "90:class_g = 'org.wezfurlong.wezterm' && focused"
      "60:class_g = 'org.wezfurlong.wezterm' && !focused"
    ];

    fade = true;
    fadeDelta = 5;

    settings = {
      frame-opacity = 1.0;
      inactive-opacity-override = false;
      corner-radius = 8;
      rounded-corners-exclude = [
        "window_type = 'desktop'"
        "window_type = 'dock'"
      ];
    };
  };
}
