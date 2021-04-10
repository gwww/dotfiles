local config = {}

local os = require 'os'
local wt = require 'wezterm'
config.keys = require 'keys'
require 'events'

config.check_for_updates = false
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.initial_cols = 179
config.initial_rows = 47
config.window_padding = {left = 2, right = 2, top = 1, bottom = 1}
config.font_size = 16.0
config.line_height = 1.05
-- config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
config.font = wt.font("Inconsolata")
config.inactive_pane_hsb = {
  brightness = 1.0,
  saturation = 0.6,
  brightness = 0.5,
}
config.colors = {
  cursor_bg = "#e0e0e0",
  cursor_border = "#e0e0e0",
  foreground = "#e0e0e0",
}

return config
