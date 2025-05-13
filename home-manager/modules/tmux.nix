{
  lib,
  pkgs,
  baseColors,
  config,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;
in
{

  programs.tmux = {
    enable = true;

    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    shortcut = "s";
    keyMode = "vi";
    sensibleOnTop = false;
    newSession = false;
    historyLimit = 20000;

    # Allows for faster key repetition
    escapeTime = 0;

    extraConfig = # tmux
      ''
        # KEYBINDS

        # =========== Pane Traversal ============
        # Start numbering at 1
        set -g base-index 1

        # switching to window number
        bind-key -n M-1 select-window -t 1
        bind-key -n M-2 select-window -t 2
        bind-key -n M-3 select-window -t 3
        bind-key -n M-4 select-window -t 4
        bind-key -n M-5 select-window -t 5
        bind-key -n M-6 select-window -t 6
        bind-key -n M-7 select-window -t 7
        bind-key -n M-8 select-window -t 8
        bind-key -n M-9 select-window -t 9

        # reload config file (change file location to your the tmux.conf you want to use)
        # ~/.config/tmux/tmux.conf
        bind r source-file ${config.xdg.configHome}/tmux/tmux.conf

        # traverse panes using A-hjkl without prefix
        bind -n M-h select-pane -L
        bind -n M-l select-pane -R
        bind -n M-k select-pane -U
        bind -n M-j select-pane -D

        # pane traversal with prefix
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R


        # =========== Pane swapping ============
        # swap pane
        bind -n M-L swap-pane -D
        bind -n M-H swap-pane -U

        # rotate panes (rotate window)
        bind -n M-J rotate-window -D
        bind -n M-K rotate-window -U


        # =========== Splitting ===============
        unbind %
        unbind '"'

        # split panes using v and V
        bind V split-window -h -c "#{pane_current_path}" 
        bind v split-window -v -c "#{pane_current_path}"

        # split panes using a and A
        bind -n M-a split-window -h -c "#{pane_current_path}"
        bind -n M-A split-window -v -c "#{pane_current_path}"




        # ============= Pane Killing and resizing ==============

        bind -n M-C kill-pane

        # resizing panes
        bind -n M-Down resize-pane -D 5
        bind -n M-Up resize-pane -U 5
        bind -n M-Left resize-pane -L 5
        bind -n M-Right resize-pane -R 5


        # ============= Opening sessions =============

        unbind w
        bind s choose-tree -sw


        # ========= Misc Options ================


        # quiet
        set -g visual-activity off
        set -g visual-bell off
        set -g visual-silence off
        setw -g monitor-activity off
        set -g bell-action none

        # automatic renaming
        set-option -g status-interval 5
        set-option -g automatic-rename on
        set-option -g automatic-rename-format '#{b:pane_current_path}'

        # keep current path as new window's path
        bind c new-window -c "#{pane_current_path}"



        # ========= Status bar Styling ==========

        # statusbar
        set -g status-position top
        set -g status-style 'bg=${hex.crust} fg=${hex.green}'

        # default window title colors
        set-window-option -g window-status-style 'fg=${hex.overlay0} bg=default'

        # active window title colors
        set-window-option -g window-status-current-style 'fg=${hex.green} bg=default' 

        # pane border
        set-option -g pane-border-style fg=${hex.base}
        set-option -g pane-active-border-style fg=${hex.overlay0}

        # message text
        set-option -g message-style 'bg=default fg=${hex.peach},bold'

        # window number display
        set -g window-status-current-format "#I #W"
        set -g window-status-format "#I #W"

        # status text
        set -g status-left '#[fg=${hex.green},bold]|#S| #[default]'
        set -g status-right ""

        # session name cutoff
        set -g status-left-length 30 

        # session manager style
        set -g mode-style "fg=${hex.yellow},bg=${hex.base}"


        # Smart pane switching with awareness of Vim splits.
        # See: https://github.com/christoomey/vim-tmux-navigator

        # decide whether we're in a Vim process
        is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
            | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

        bind-key -n 'M-h' if-shell "$is_vim" 'send-keys M-h' 'select-pane -L'
        bind-key -n 'M-j' if-shell "$is_vim" 'send-keys M-j' 'select-pane -D'
        bind-key -n 'M-k' if-shell "$is_vim" 'send-keys M-k' 'select-pane -U'
        bind-key -n 'M-l' if-shell "$is_vim" 'send-keys M-l' 'select-pane -R'

        tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'

        if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
            "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\'  'select-pane -l'"
        if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
            "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\\\'  'select-pane -l'"

        bind-key -n 'M-Space' if-shell "$is_vim" 'send-keys M-Space' 'select-pane -t:.+'

        bind-key -T copy-mode-vi 'M-h' select-pane -L
        bind-key -T copy-mode-vi 'M-j' select-pane -D
        bind-key -T copy-mode-vi 'M-k' select-pane -U
        bind-key -T copy-mode-vi 'M-l' select-pane -R
        # bind-key -T copy-mode-vi 'C-M-\ ' select-pane -l

        bind-key -T copy-mode-vi 'M-Space' select-pane -t:.+


        ## ============= CUSTOM COMMANDS =================

        # Run the last command of the last pane
        bind-key Enter run-shell '
          original_pane=$(tmux display-message -p "#{pane_id}") &&
          tmux last-pane &&
          tmux send-keys Up Enter &&
          tmux select-pane -t "$original_pane"
        '

      '';

  };

}
