-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)
-- [Color Schemes - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/colorschemes/index.html)

local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Black Atom - Medical"

config.colors = { background = "#d4dbd8" }

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 35

local Jet = "JetBrains Mono"
local Berkeley = "Berkeley Mono"
local Operator = "Operator Mono"
local Maple = "Maple Mono"
local Comic = "Comic Code Ligatures"
local SF = "SF Mono"
local iaM = "iA Writer Mono S"

local font_family = Jet

config.font = wezterm.font({
	family = font_family,
	weight = 400,
	harfbuzz_features = { "zero", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "cv05" },
})

-- https://wezfurlong.org/wezterm/config/lua/config/font_rules.html
config.font_rules = {
	{
		intensity = "Normal",
		italic = false,
		font = wezterm.font({
			family = Jet,
		}),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = Jet,
			weight = "Bold",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = Maple,
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = Maple,
			weight = "Bold",
			style = "Italic",
		}),
	},
}

config.font_size = 12
config.line_height = 1.25

config.window_frame = {
	font = wezterm.font({ family = font_family }),
	font_size = 12.0,
}

config.window_padding = {
	left = 50,
	right = 50,
	top = 35,
	bottom = 35,
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
