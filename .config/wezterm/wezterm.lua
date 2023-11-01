local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)
-- [Color Schemes - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/colorschemes/index.html)

-- config.color_scheme = "tokyonight_storm"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "terafox"
-- config.color_scheme = "carbonfox"
-- config.color_scheme = "nordfox"
config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "Terra Summer Night"
-- config.color_scheme = "GitHub Dark"

config.colors = {
	-- background = "#0a1214",
	-- background = "#0d1011",
	-- background = "#181b1d",
	-- background = "#222c2f",

	-- background = "#22272E", -- Github Dimmed Dark

	-- background = "#152A1F", -- TeraFox (Custom)
	-- background = "#18271f", -- TeraFox (Custom)

	-- background = "#171d1b", -- mini_slime
	-- background = "#191C22", -- mini_blue

	-- background = "#151a1c", -- Nordfox

	background = "#252221", -- Terra Fall Night

	-- background = "#1c2a23", -- Terra Spring Night

	-- Terra Summer Night
	-- background = "#1d232b",
	-- foreground = "#ded9d3",
}

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 65

local font_family = "JetBrainsMono Nerd Font"
-- local font_family = "Geist Mono"
-- local font_family = "MapleMono Nerd Font"
-- local font_family = "BerkeleyMono Nerd Font"
-- local font_family = "ComicCodeLigatures Nerd Font"
-- local font_family = "SFMono Nerd Font"

config.font = wezterm.font({
	family = font_family,
	weight = 400,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
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

local function isViProcess(pane)
	-- get_foreground_process_name On Linux, macOS and Windows,
	-- the process can be queried to determine this path. Other operating systems
	-- (notably, FreeBSD and other unix systems) are not currently supported
	return pane:get_foreground_process_name():find("n?vim") ~= nil
	-- return pane:get_title():find("n?vim") ~= nil
end

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

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

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
