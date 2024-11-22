-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.initial_rows = 45
config.initial_cols = 150

-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font = wezterm.font("Cascadia Code", { weight = "DemiLight", stretch = "Normal", style = "Normal" })
config.font_size = 16

config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Mono Cyan (Gogh)"
-- config.color_scheme = "Nord (Gogh)"
-- config.color_scheme = "Dracula"
-- config.color_scheme = "melange_light"
-- config.color_scheme = "melange_dark"

config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 9

-- Background image settings
-- config.window_background_image = "/Users/bbkboris/Pictures/wp5144550-retrowave-hd-desktop-wallpapers.jpg"
-- config.window_background_image_hsb = {
-- 	-- Darken the background image by reducing it to 1/3rd
-- 	brightness = 0.1,
--
-- 	-- You can adjust the hue by scaling its value.
-- 	-- a multiplier of 1.0 leaves the value unchanged.
-- 	hue = 1.0,
--
-- 	-- You can adjust the saturation also.
-- 	saturation = 1.0,
-- }
config.text_background_opacity = 0.9

config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

config.scrollback_lines = 10000

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "l", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.SendKey({ key = "l", mods = "ALT" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
}

-- and finally, return the configuration to wezterm
return config
