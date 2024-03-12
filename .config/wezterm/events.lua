local wt = require "wezterm"

wt.on(
    "window-config-reloaded",
    function(window, _) window:toast_notification("Configuration loaded.", "", nil, 5000) end
)

-- This produces a window split horizontally into two equal parts
wt.on("gui-startup", function(cmd)
    local _, _, window = wt.mux.spawn_window(cmd or {})
    if wt.gui.screens().active.name == "Built-in Retina Display" then window:gui_window():maximize() end
    -- pane:split {size=0.3}
    -- pane:split {direction="Left", size=0.5}
end)
