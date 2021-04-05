local wt = require 'wezterm'
local keys = {}

local mapkey = function(mods, key, action)
  keys[#keys + 1] = {key=key, mods=mods, action=action}
end

local emit_event = function(event) return wt.action {EmitEvent = event} end

mapkey('CMD',       'd', {SplitHorizontal={}})
mapkey('CMD|SHIFT', 'd', {SplitVertical={}})
mapkey('CMD',       'e', emit_event("edit-wezterm-config"))
mapkey('CMD',       'w', {CloseCurrentPane={confirm=true}})
mapkey('CMD',       'z', "TogglePaneZoomState")

return keys
