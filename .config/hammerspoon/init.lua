require("caffeine")
require("window-fns")
require("application-watcher")
hyper = require("hyper")

ins = hs.inspect.inspect -- ease typing when debugging

-- Array of app bindings. Each binding can have a "key", "modifiers", & "action".
local app_bindings = {
  {key='a', action=function() smartLaunchOrFocus("Forklift") end},
  {key='c', action=caffeinate},
  {key='f', action=function() smartLaunchOrFocus( "Finder" ) end},
  {key='h', action=function() os.execute( "open ~" ) end},
  {key='m', action=function() toggleFullscreen() end},
  {key='q', action=function() smartLaunchOrFocus( "Firefox" ) end},
  {key='r', action=hs.reload},
  {key='s', action=function() smartLaunchOrFocus( "Slack" ) end},
  {key='v',
    action=function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end},
  {key='w', action=function() smartLaunchOrFocus( "iTerm" ) end},
  {key='y', action=hs.toggleConsole},
  {key='z', action=function() smartLaunchOrFocus( "zoom.us" ) end},
}

local movement_bindings = {
  {key='left',
    action=cycleCalls(toGrid, {{0,0,0.5,1},   {0,0,2/3,1},   {0,0,1/3,1}})},
  {key='right',
    action=cycleCalls(toGrid, {{0.5,0,0.5,1}, {1/3,0,2/3,1}, {2/3,0,1/3,1}})},
  {key='left', modifiers='shift',
    action=function() moveWindowScreen(hs.window.focusedWindow(), 'West') end},
  {key='right', modifiers='shift',
    action=function() moveWindowScreen(hs.window.focusedWindow(), 'East') end},
  {key='up', action=function() toGrid({0,0,1,0.3}) end},
  {key='down', action=function() toGrid({0,0.7,1,0.3}) end},
  {key='space', action=function() toggleMaximize(hs.window.focusedWindow()) end},
}

hyper.init('F20') -- Caps Lock is mapped to F20 using /usr/bin/hidutil
hyper.bind(app_bindings)
hyper.bind(movement_bindings)

-- Last, show a notification that the config is finished loading
hs.notify.new({title='Hammerspoon', subTitle='Configuration loaded'}):send()
