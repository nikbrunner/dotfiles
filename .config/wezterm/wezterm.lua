---@diagnostic disable: unused-local
-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)
-- [Color Schemes - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/colorschemes/index.html)

local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Black Atom - Engineering"
config.colors = {
	background = "#0e1110",
}

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 50

local Jet = "JetBrainsMono Nerd Font"
local Berkeley = "Berkeley Mono"
local Operator = "Operator Mono"
local Maple = "Maple Mono"
local Fira = "FiraMono Nerd Font"
local FiraCode = "FiraCode Nerd Font"
local Comic = "Comic Code Ligatures"
local SF = "SF Mono"
local iaM = "iA Writer Mono S"
local Iosevka = "Iosevka Nerd Font"
local IosevkaSlab = "IosevkaTermSlab Nerd Font"
local Zed = "ZedMono Nerd Font"
local Overpass = "OverpassM Nerd Font"

local font_family = Jet

config.bold_brightens_ansi_colors = true

config.font = wezterm.font({
	family = font_family,
	weight = 400,
})

config.font_size = 14
config.line_height = 1.25

-- -- https://wezfurlong.org/wezterm/config/lua/config/font_rules.html
-- config.font_rules = {
-- 	{
-- 		intensity = "Normal",
-- 		italic = false,
-- 		font = wezterm.font({
-- 			family = Jet,
-- 		}),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font({
-- 			family = Jet,
-- 			weight = "Bold",
-- 		}),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font({
-- 			family = Maple,
-- 			style = "Italic",
-- 		}),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font({
-- 			family = Maple,
-- 			weight = "Bold",
-- 			style = "Italic",
-- 		}),
-- 	},
-- }

config.window_frame = {
	font = wezterm.font({ family = font_family }),
	font_size = 14.0,
}

config.window_padding = {
	left = 50,
	right = 50,
	top = 35,
	bottom = 35,
}

config.keys = {
	{
		key = "p",
		mods = "CMD",
		action = act.ActivateCommandPalette,
	},
	{
		key = "u",
		mods = "SHIFT|CTRL",
		action = wezterm.action.CharSelect({
			copy_on_select = true,
			copy_to = "ClipboardAndPrimarySelection",
		}),
	},
}

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 50

config.command_palette_font_size = 14.0

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
