local wt = require("wezterm")

local config = wt.config_builder()

-- config.front_end = "WebGpu"
config.check_for_updates = false
config.window_decorations = "RESIZE"
config.swallow_mouse_click_on_pane_focus = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.force_reverse_video_cursor = true
config.enable_csi_u_key_encoding = true
config.window_padding = { left = 8, right = 2, top = 1, bottom = 1 }

config.font_size = 16.5
config.line_height = 1.10
config.font = wt.font_with_fallback({
  { family = "Inconsolata",            weight = "Regular" },
  { family = "Symbols Nerd Font Mono", scale = 0.80 },
})
config.warn_about_missing_glyphs = false

config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.5,
}
config.window_frame = {
  font_size = 13.0,
  font = wt.font("Roboto"),
}
config.colors = {
  background = "#151515",
  foreground = "#e0e0e0",
  tab_bar = {
    background = "#030303",
    active_tab = {
      fg_color = "#7CFC00",
      bg_color = "#181818",
    },
    inactive_tab = {
      fg_color = "#a0a0a0",
      bg_color = "#202020",
    },
  },
}

config.command_palette_font_size = 14.0
config.command_palette_bg_color = "#b4caf0"
config.command_palette_fg_color = "#222222"

return config
