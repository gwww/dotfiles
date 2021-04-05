local wt = require 'wezterm'
local keys = {}

local mapkey = function(mods, key, action)
  keys[#keys + 1] = {key=key, mods=mods, action=action}
end

local edit_wezterm_config = function()
  local files = "wezterm.lua keys.lua events.lua"
  local args = {os.getenv("SHELL"), "-c", "exec $VISUAL " .. files}
  return {SpawnCommandInNewTab = {cwd=wt.config_dir, args=args}}
end

mapkey('CMD',       'd', {SplitHorizontal={}})
mapkey('CMD|SHIFT', 'd', {SplitVertical={}})
mapkey('CMD',       'e', edit_wezterm_config())
mapkey('CMD',       'w', {CloseCurrentPane={confirm=true}})
mapkey('CMD',       'z', "TogglePaneZoomState")

return keys
