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

        front_end = "WebGpu", -- 24.11 workaround https://github.com/NixOS/nixpkgs/issues/336069

        color_scheme = "Catppuccin Macchiato",
        font = wezterm.font("UbuntuMono Nerd Font", { weight = "Regular", italic = false }),
        font_size = 12.0,
        freetype_load_flags = 'FORCE_AUTOHINT',

        enable_tab_bar = false,
        window_padding = {
          bottom = 0,
          top = 0,
        },

        warn_about_missing_glyphs = false,

        selection_word_boundary = ' \t\n{}[]()"\'`,:',

        default_prog = { "zsh" },
    }
    '';
  };
}
