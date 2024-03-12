local wt = require "wezterm"

local config = wt.config_builder()

config.font_size = 16.5
config.font = wt.font_with_fallback {
  { family = "Inconsolata",            weight = "Regular" },
  { family = "Symbols Nerd Font Mono", scale = 0.80 },
}
config.check_for_updates = false
config.command_palette_font_size = 14.0
config.command_palette_bg_color = "#b4caf0"
config.command_palette_fg_color = "#222222"
config.color_scheme = "Catppuccin Mocha"
config.colors = { background = "hsl(223, 15%, 14%)" }
config.force_reverse_video_cursor = true
config.inactive_pane_hsb = { saturation = 0.6, brightness = 0.5 }
config.line_height = 1.10
config.warn_about_missing_glyphs = false
config.window_decorations = "RESIZE"
config.window_frame = { font_size = 13.0, font = wt.font "Roboto" }
config.window_padding = { left = "6pt", right = "2pt", top = "1pt", bottom = "1pt" }

return config

-- config.enable_csi_u_key_encoding = true
-- config.enable_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = false
-- config.swallow_mouse_click_on_pane_focus = true
