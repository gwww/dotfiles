local wt = require("wezterm")

wt.on(
    "window-config-reloaded",
    function(window, pane) window:toast_notification("Configuration loaded.", "", nil, 5000) end
)

-- This produces a window split horizontally into two equal parts
wt.on("gui-startup", function()
    local tab, pane, window = wt.mux.spawn_window({})
    window:gui_window():maximize()
    -- pane:split {size=0.3}
    -- pane:split {direction="Left", size=0.5}
end)
