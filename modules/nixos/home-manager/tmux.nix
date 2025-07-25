{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    # mouse = true;
    # terminal = "tmux-256color";
    # keyMode = "vi";
    # aggressiveResize = true;
    #
    # baseIndex = 1;
    # paneBaseIndex = 1;
    #
    # historyLimit = 100000;
    # escapeTime = 10;

    # prefix = "C-a";

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      vim-tmux-navigator
      battery
      online-status
    ];
    extraConfig = ''
      set -s escape-time 10
      set -g history-limit 50000
      set -g display-time 4000
      set -g status-interval 5
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -g mode-keys vi
      set -g focus-events on
      setw -g aggressive-resize on

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      set -sg escape-time 10

      bind -n S-Left previous-window
      bind -n S-Right next-window

      unbind C-b
      set -g prefix C-a
      bind-key C-a send-prefix
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
      bind-key -T copy-mode-vi 'y' send -X copy-selection
      unbind-key -T copy-mode-vi MouseDragEnd1Pane
      bind-key -T copy-mode-vi MouseDown1Pane send-keys -X clear-selection

      unbind z
      bind -r m resize-pane -Z

      unbind %
      bind | split-window -h -c "#{pane_current_path}"

      unbind '"'
      bind - split-window -v -c "#{pane_current_path}"
      bind _ split-window -vl 10 -c "#{pane_current_path}"

      unbind c
      bind c new-window -c "#{pane_current_path}"

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Configure Catppuccin
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_status_background "none"
      set -g @catppuccin_window_status_style "none"
      set -g @catppuccin_pane_status_enabled "off"
      set -g @catppuccin_pane_border_status "off"

      # Configure online status
      set -g @online_icon "ok"
      set -g @offline_icon "nok"

      # Configure status left
      set -g status-left-length 100
      set -g status-left ""
      set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold]  #S },#{#[bg=#{@thm_bg},fg=#{@thm_green}]  #S }}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_maroon}]  #{pane_current_command} "
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

      # Configure status right
      set -g status-right-length 100
      set -g status-right ""
      set -ga status-right "#{?#{e|>=:10,#{battery_percentage}},#{#[bg=#{@thm_red},fg=#{@thm_bg}]},#{#[bg=#{@thm_bg},fg=#{@thm_pink}]}} #{battery_icon} #{battery_percentage} "
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]│"
      set -ga status-right "#[bg=#{@thm_bg}]#{?#{==:#{online_status},ok},#[fg=#{@thm_mauve}] 󰖩 on ,#[fg=#{@thm_red},bold]#[reverse] 󰖪 off }"
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]│"
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_blue}] 󰭦 %Y-%m-%d 󰅐 %H:%M "

      # Configure Tmux
      set -g status-position bottom
      set -g status-style "bg=#{@thm_bg}"
      set -g status-justify "absolute-centre"

      # Configure pane border
      setw -g pane-border-status off
      setw -g pane-border-format ""
      setw -g pane-active-border-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"
      setw -g pane-border-style "bg=#{@thm_bg},fg=#{@thm_surface_0}"
      setw -g pane-border-lines single

      # Configure window
      set -wg automatic-rename on
      set -g automatic-rename-format "Window"
      set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-style "bg=#{@thm_bg},fg=#{@thm_rosewater}"
      set -g window-status-last-style "bg=#{@thm_bg},fg=#{@thm_peach}"
      set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"
      set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold"
      set -gF window-status-separator "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}]│"

      set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-current-style "bg=#{@thm_peach},fg=#{@thm_bg},bold"

      set -g @vim_navigator_mapping_left "C-Left C-h"
      set -g @vim_navigator_mapping_right "C-Right C-l"
      set -g @vim_navigator_mapping_up "C-k"
      set -g @vim_navigator_mapping_down "C-j"
      set -g @vim_navigator_mapping_prev ""

      # For Yazi
      # set -g allow-passthrough all
      # set -ga update-environment TERM
      # set -ga update-environment TERM_PROGRAM
    '';
  };
}
