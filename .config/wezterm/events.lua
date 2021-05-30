local wt = require 'wezterm'

wt.on("window-config-reloaded", function(window, pane)
  -- window:perform_action(wt.action{SplitHorizontal={}}, pane)
  window:toast_notification("Configuration loaded.", "", nil, 5000)
  -- window:set_right_status(wt.format({
  --   {Background={Color="blue"}},
  --   {Text=" Configuration reloaded. "},
  -- }))
  -- wt.sleep_ms(3000)
  -- window:set_right_status("")
end)
