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
config.initial_cols = 179
config.initial_rows = 47
config.window_padding = {left = 8, right = 2, top = 1, bottom = 1}
config.font_size = 16.0
config.line_height = 1.05
-- config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
config.font = wt.font("Inconsolata")
config.warn_about_missing_glyphs = false
config.inactive_pane_hsb = {
  brightness = 1.0,
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
  foreground = "#e0e0e0",

  tab_bar = {
    background = "#030303",
    active_tab = {
      fg_color = "#7CFC00",
      bg_color = "#2b2042",
    },
    inactive_tab = {
      fg_color = "#a0a0a0",
      bg_color = "#1b1032",
    },
  },
}

return config
