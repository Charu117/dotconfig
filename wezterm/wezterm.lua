-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- apply config choices

config.font = wezterm.font("Fira Code", { weight = "Regular", stretch = "Normal", italic = false })
config.font_size = 12

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
	position = "top",
	max_width = 32,
	dividers = "arrows", -- or "slant_left", "slant-right", "rounded", false
	indicator = {
		leader = {
			enabled = true,
			off = " ",
			on = " ",
		},
		mode = {
			enabled = true,
			names = {
				resize_mode = "RESIZE",
				copy_mode = "VISUAL",
				search_mode = "SEARCH",
			},
		},
	},
	tabs = {
		numerals = "arabic", -- or "roman"
		pane_count = "", -- or "subscript", false
		brackets = {
			active = { "", " ◉" },
			inactive = { "", " ◯" },
		},
	},
	clock = { -- note that this overrides the whole set_right_status
		enabled = false,
		format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
	},
})
config.color_scheme = "Catppuccin Mocha"

-- and finally, return the configuration to wezterm
return config
