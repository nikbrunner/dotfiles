-- [Configuration - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/files.html)
-- [Default Key Assignments - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/default-keys.html)

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night"

config.font = wezterm.font({
	family = "JetBrains Mono",
	-- family = "OperatorMono Nerd Font",
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
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),

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

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#575757",
	},
}

config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true

config.enable_tab_bar = false

config.command_palette_font_size = 18.0

config.window_background_opacity = 0.95
config.macos_window_background_blur = 25

return config
