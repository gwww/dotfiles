local config = dofile("/Users/glenn/.config/wezterm/config.lua")
-- local config = wt.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.initial_rows = 30
config.initial_cols = 150

return config
