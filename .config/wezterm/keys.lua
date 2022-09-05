local wt = require("wezterm")
local keys = {}

local mapkey =
    function(mods, key, action) keys[#keys + 1] = { key = key, mods = mods, action = action } end

local edit_wezterm_config = function()
    local files = "wezterm.lua keys.lua events.lua"
    local args = { os.getenv("SHELL"), "-lic", "exec $VISUAL " .. files }
    return wt.action.SpawnCommandInNewTab {cwd=wt.config_dir, args=args}
end

mapkey("CMD", "d", wt.action.SplitHorizontal)
mapkey("CMD|SHIFT", "d", wt.action.SplitVertical)
mapkey("CMD", "e", edit_wezterm_config())
mapkey("CTRL|SHIFT", "l", "ShowDebugOverlay")
mapkey("CMD", "w", wt.action.CloseCurrentPane {confirm = true})
mapkey("CMD", "z", "TogglePaneZoomState")

return keys
