{
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    extraConfig = /* lua */ ''
      return {
        wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
          return 'wezterm'
        end),

        color_scheme = "Catppuccin Mocha",
        font = wezterm.font("UbuntuMono Nerd Font", { weight = "Regular", italic = false }),
        font_size = 12.0,
        freetype_load_flags = 'FORCE_AUTOHINT',

        enable_tab_bar = false,
        window_padding = {
          bottom = 0,
          top = 0,
        },

        warn_about_missing_glyphs = false,

        default_prog = { "zsh" },
    }
    '';
  };
}
