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
        set-option -g allow-rename off

        overlay="#6e738d"
        surface="#15161e"

        peach="#fab388"
        mauve="#cba6f7"
        teal="#94e2d5"

        base="#24273a"
        surface="#313244"
        mantle="#181825"

        text="#cdd6f4"

        set-option -g status-style bg=$base

        set -g status-right "#[fg=$mauve,bg=default]tmuxin at #{?client_prefix,#[bg=default fg=$peach],#[bg=default fg=$mauve]}#h"
        set -g status-left ""

        set -g status-justify left

        # #!~M not handled, not sure if I ever see them
        sed_cmd="sed 's/*Z/#[nodim]󰡬 /;s/*/#[nodim]󰛐 /;s/Z//;s/-/󱣾 /;s/^$/󰛑 /'"
        flags="#[dim]#(printf '%%s\n' '#F' | $sed_cmd )#[nodim]"
        right_sep="#[fg=$surface,bg=default]"
        left_sep="#[fg=$mauve,bg=$surface]"
        left_sep_current="#[fg=$peach,bg=$surface]"
        set -g window-status-format "$left_sep#[fg=$surface,bg=$mauve,bold]#I #[fg=$text,bg=$surface,nobold] #W $flags$right_sep"
        set -g window-status-current-format "$left_sep_current#[fg=$surface,bg=$peach,bold]#I #[fg=$text,bg=$surface,nobold] #W $flags$right_sep"
        set -g window-status-separator ' '

        set -g message-command-style bg=default,fg=$text
        set -g message-style bg=default,fg=$text
        set -g mode-style bg=$surface,fg=$teal

        set -g pane-active-border-style fg=$mauve,bg=default
        set -g pane-border-style fg=$base,bg=$base

        set -g default-terminal "tmux-256color"
        '';
    plugins = with pkgs; [ 
      {
        plugin = tmuxPlugins.yank;
      }
      {
        plugin = tmuxPlugins.sensible;
      }
    ];
  };
}
