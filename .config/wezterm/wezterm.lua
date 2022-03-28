local config = {}

local os = require 'os'
local wt = require 'wezterm'
config.keys = require 'keys'
require 'events'

config.check_for_updates = false
config.window_decorations = "RESIZE"
config.swallow_mouse_click_on_pane_focus = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.initial_rows = 50
config.initial_cols = 180

config.window_padding = {left = 8, right = 2, top = 1, bottom = 1}

config.font_size = 16.5
config.line_height = 1.05
config.font = wt.font("Inconsolata", {weight="Regular"})
config.warn_about_missing_glyphs = false

config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.5,
}
config.window_frame = {
  font_size = 13.0,
  font = wt.font("Roboto")
}
config.colors = {
  cursor_bg = "#e0e0e0",
  cursor_border = "#e0e0e0",

  background = "#181818",
  foreground = "#e0e0e0",

  tab_bar = {
    background = "#030303",
    active_tab = {
      fg_color = "#7CFC00",
      bg_color = "#181818",
    },
    inactive_tab = {
      fg_color = "#a0a0a0",
      bg_color = "#2b2042",
    },
  },
}

return config
