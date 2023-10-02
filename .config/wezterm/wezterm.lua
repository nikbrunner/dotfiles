-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- local font_family = "JetBrainsMono Nerd Font"
local font_family = "BerkeleyMono Nerd Font"
-- local font_family = "SFMono Nerd Font"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- [Color Schemes - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/colorschemes/index.html)
-- config.color_scheme = "Tokyo Night Moon"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "terafox"
-- config.color_scheme = "carbonfox"
-- config.color_scheme = "nordfox"
config.color_scheme = "Gruvbox Material (Gogh)"

config.colors = {
	-- background = "#151a1c", -- Nordfox
	background = "#232323", -- Terra Fall Night
	-- background = "#1c2a23", -- Terra Spring Night
	-- background = "#070b0d", -- Terra Control Night
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#575757",
	},
}

-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 65

local WALLPAPER_FOLDER = "/Users/nikolausbrunner/Pictures/wallpapers"

-- config.background = {
-- 	{
-- 		-- 	source = { File = WALLPAPER_FOLDER .. "/themes/tokyo/tokyo-night32 blur.png" },
-- 		-- 	source = { File = WALLPAPER_FOLDER .. "/themes/tokyo/tokyo-night24.png" },
-- 		-- source = { File = WALLPAPER_FOLDER .. "/themes/nord/nord_4.jpg" },
-- 		-- source = { File = WALLPAPER_FOLDER .. "/themes/nord/nord_13.jpg" },
-- 		source = { File = WALLPAPER_FOLDER .. "/themes/nord/nord_17.jpg" },
-- 		-- source = { File = WALLPAPER_FOLDER .. "/vibrant/blue.jpg" },
-- 		-- source = { File = WALLPAPER_FOLDER .. "/vibrant/polyblack.jpg" },
-- 		hsb = {
-- 			-- brightness = 0.2,
-- 			brightness = 0.1,
-- 		},
-- 	},
-- }
--
config.font = wezterm.font({
	family = font_family,
	weight = "Regular",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.font_size = 16
config.line_height = 1.2

config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = font_family, weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 16.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
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

config.enable_tab_bar = false

config.command_palette_font_size = 18.0

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make task numbers clickable
-- the first matched regex group is captured in $1.
table.insert(config.hyperlink_rules, {
	regex = [[\b(BCD-\d{4})\b]],
	format = "https://dcd.myjetbrains.com/youtrack/issue/$1",
})

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

-- make urls clickable by bypassing the mouse reporting modifiers
config.bypass_mouse_reporting_modifiers = "CMD"

return config
