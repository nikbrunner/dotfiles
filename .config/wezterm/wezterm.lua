---@diagnostic disable: unused-local
-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)
-- [Color Schemes - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/colorschemes/index.html)

local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.colors = { background = "#252221" } -- Terra Fall Night
-- Terra Spring Night
-- config.colors = {
-- 	background = "#212523",
-- 	foreground = "#e0ddd1",
-- }

-- Terra Winter Night
config.color_scheme = "nord"
config.colors = { background = "#232427" }

local wallpapers_dir = os.getenv("HOME") .. "/.config/wezterm/wallpapers"

config.background = {
	{
		source = {
			File = wallpapers_dir .. "/ash.png",
		},
		height = "Cover",
		vertical_align = "Middle",
		repeat_x = "NoRepeat",
		hsb = {
			brightness = 0.25,
			saturation = 0.75,
		},
	},
}

config.window_background_opacity = 0.9
config.macos_window_background_blur = 65

local JetBrainsMono = "JetBrainsMono Nerd Font"
local MapleMono = "MapleMono Nerd Font"
local BerkeleyMono = "BerkeleyMono Nerd Font"
local ComicCodeLigatures = "ComicCodeLigatures Nerd Font"
local SFMono = "SFMono Nerd Font"
local CommitMono = "CommitMono"
local MonaspaceRadon = "Monaspace Radon"
local MonaspaceKrypton = "Monaspace Krypton"

local font_family = JetBrainsMono

config.font = wezterm.font({
	family = font_family,
	weight = 400,
	harfbuzz_features = {
		"calt=0",
		"clig=0",
		"liga=0",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
		"calt",
		"dlig",
	},
})

-- TODO: Setup different italic font
-- config.font_rules = {
-- 	{
-- 		italic = true,
-- 		font = MapleMono,
-- 	},
-- }

config.font_size = 16
config.line_height = 1.2

config.window_frame = {
	font = wezterm.font({
		family = font_family,
		weight = "Bold",
	}),
	font_size = 16.0,
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
