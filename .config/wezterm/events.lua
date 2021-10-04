local wt = require 'wezterm'

wt.on("window-config-reloaded", function(window, pane)
  window:toast_notification("Configuration loaded.", "", nil, 5000)
end)
