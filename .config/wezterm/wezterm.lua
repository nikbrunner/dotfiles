---@diagnostic disable: unused-local
-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)
-- [Color Schemes - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/colorschemes/index.html)

local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Everforest Light (Gogh)"

config.colors = { background = "#e4e1db" }

-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 35

local Jet = "JetBrains Mono"
local Berkeley = "Berkeley Mono"
local Operator = "Operator Mono"
local Maple = "Maple Mono"
local Comic = "Comic Code Ligatures"
local SF = "SF Mono"
local iaM = "iA Writer Mono S"

local font_family = Maple

config.font = wezterm.font({
	family = font_family,
	weight = 400,
})

config.font_size = 14
config.line_height = 1.2

config.window_frame = {
	font = wezterm.font({ family = font_family }),
	font_size = 12.0,
}

config.window_padding = {
	left = 50,
	right = 50,
	top = 50,
	bottom = 50,
}

local act = wezterm.action

config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = "CMD",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "p",
		mods = "CMD",
		action = act.ActivateCommandPalette,
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.command_palette_font_size = 18.0

config.hyperlink_rules = wezterm.default_hyperlink_rules()

table.insert(config.hyperlink_rules, {
	regex = [[\b(BCD-\d{4})\b]],
	format = "https://dcd.myjetbrains.com/youtrack/issue/$1",
})

table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

config.bypass_mouse_reporting_modifiers = "CMD"

return config
