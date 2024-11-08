{
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = /* bash */ ''
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

        set-option -g renumber-windows on
    '';
    plugins = with pkgs; [ 
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = /* bash */ ''
            set -g @catppuccin_flavour 'mocha'

            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_current_text "#W"

            set -g @catppuccin_status_left_separator  ""
            set -g @catppuccin_status_right_separator " "
            set -g @catppuccin_status_fill "all"
            set -g @catppuccin_status_connect_separator "yes"

            set -g status-left ""
            set -gF status-right "#{E:@catppuccin_status_application}#{E:@catppuccin_status_session}"
        '';
      }
      {
        plugin = tmuxPlugins.yank;
      }
      {
        plugin = tmuxPlugins.sensible;
      }
    ];
  };
}
