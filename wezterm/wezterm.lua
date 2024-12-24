local wezterm = require("wezterm")

return {
	window_decorations = "RESIZE",
	font = wezterm.font("MonoLisa"),
	font_size = 16,
	line_height = 1.4,
	scrollback_lines = 5000,
	hide_tab_bar_if_only_one_tab = true,
	default_prog = {
		"/bin/zsh",
		"--login",
		"-c",
		[=[
				if command -v tmux >/dev/null 2>&1; then
          if [[ $(tmux ls | grep -v attached | wc -l | awk '{$1=$1};1') == 0 ]]; then
            tmux new;
          else
            tmux attach | tmux new;
          fi
				else
					exec zsh;
				fi
			]=],
	},
	color_scheme = "Catppuccin Mocha",
	front_end = "WebGpu",
	window_padding = {
		top = 10,
		bottom = 0,
		left = 5,
		right = 5,
	},
	max_fps = 120,
	window_close_confirmation = "NeverPrompt",
}
