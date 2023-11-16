---@diagnostic disable: unused-local
-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)
-- [Color Schemes - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/colorschemes/index.html)

local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Terra Fall Night
config.color_scheme = "Gruvbox Material (Gogh)"
config.colors = { background = "#252221" }

-- Terra Winter Night
-- config.color_scheme = "nord"
-- config.colors = { background = "#232427" }

-- Solarized Osaka
-- config.color_scheme = "solarized"
-- config.colors = { background = "#041419" }

local JetBrainsMono = "JetBrainsMono Nerd Font"
local MapleMono = "MapleMono Nerd Font"
local BerkeleyMono = "BerkeleyMono Nerd Font"
local ComicCodeLigatures = "ComicCodeLigatures Nerd Font"
local SFMono = "SFMono Nerd Font"
local Iosevka = "Iosevka Nerd Font"
local MonaspaceNeon = "Monaspace Neon"
local MonaspaceArgon = "Monaspace Argon"
local MonaspaceXenon = "Monaspace Xenon"
local MonaspaceRadon = "Monaspace Radon"
local MonaspaceKrypton = "Monaspace Krypton"
local CommitMono = "CommitMono"

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
	left = 25,
	right = 25,
	top = 25,
	bottom = 25,
}

config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 65

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
