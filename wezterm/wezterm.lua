local wezterm = require("wezterm")
return {
	-- color_scheme = "termnial.sexy",
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 20.0,
	-- font = wezterm.font("JetBrains Mono"),
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium" }),
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
	-- freetype_load_target="Light",
	line_height = 1.15,
	-- cell_width=1.02,

	macos_window_background_blur = 30,

	-- window_background_image = '/Users/omerhamerman/Downloads/3840x1080-Wallpaper-041.jpg',
	-- window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.5,
	-- },
	window_background_opacity = 0.92,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
