require("caffeine")
require("window-fns")
require("smartLaunch")
require("application-watcher")
local hyper = require("hyper")

ins = hs.inspect.inspect -- ease typing when debugging

-- Array of app bindings. Each binding can have a "key", "modifiers", & "action".
local bindings = {
  {key='a', action=function() smartLaunch("Forklift") end},
  {key='c', action=caffeinate},
  {key='f', action=function() smartLaunch("Finder") end},
  {key='h', action=function() os.execute("open ~") end},
  {key='m', action=function() toggleFullscreen() end},
  {key='q', action=function() smartLaunch("Firefox") end},
  {key='r', action=hs.reload},
  {key='s', action=function() smartLaunch("Slack") end},
  {key='v',
    action=function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end},
  {key='w', action=function() smartLaunch("iTerm") end},
  {key='x', action=function() smartLaunch("Cisco Webex Meetings") end},
  {key='y', action=hs.toggleConsole},
  {key='z', action=function() smartLaunch("zoom.us") end},

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
hyper.bind(bindings)
smartLaunchInit(hyper)

-- Last, show a notification that the config is finished loading
hs.notify.new({title='Hammerspoon', subTitle='Configuration loaded'}):send()
