appWatcher = require("applicationWatcher")
caffeinate = require("caffeine")
hyper = require("hyper")
sl = require("smartLaunch")
wf = require("windowFunctions")

ins = hs.inspect.inspect -- ease typing when debugging
-- hs.application.enableSpotlightForNameSearches(true)

-- CapsLock is mapped to F20 using /usr/bin/hidutil
hyper.init('F20')
-- hyper.addHook(nil, function(presses) hyper.escape(presses) end)
hyper.addHook(nil, function(presses) end) -- ignore hyper key press/realease
hyper.bind({
  -- Table of app bindings. Each binding can have a "key", "modifiers", & "action".
  {key='a', action=function() sl.smartLaunch("ForkLift") end},
  {key='c', action=caffeinate},
  {key='d', action=function() sl.smartLaunch("Microsoft Teams") end},
  {key='e', action=function() sl.smartLaunch("com.googlecode.iterm2", "iTerm") end},
  {key='f', action=function() sl.smartLaunch("Finder") end},
  {key='h', action=function() os.execute("open ~") end},
  {key='m', action=function() toggleFullscreen() end},
  {key='q', action=function() sl.smartLaunch("Firefox") end},
  {key='r', action=hs.reload},
  {key='s', action=function() sl.smartLaunch("Slack") end},
  {key='v', action=function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end},
  {key='w', action=function() sl.smartLaunch("WezTerm") end},
  {key='x', action=function() sl.smartLaunch("Cisco Webex Meetings") end},
  {key='y', action=hs.toggleConsole},
  {key='z', action=function() sl.smartLaunch("zoom.us") end},

  {key='left',  action=wf.cycleCalls(wf.toGrid, {{0,0,0.5,1}, {0,0,2/3,1}, {0,0,1/3,1}})},
  {key='right', action=wf.cycleCalls(wf.toGrid, {{0.5,0,0.5,1}, {1/3,0,2/3,1}, {2/3,0,1/3,1}})},
  {key='left',  modifiers='shift', action=function() moveScreen('West') end},
  {key='right', modifiers='shift', action=function() moveScreen('East') end},
  {key='up',    action=function() wf.toGrid({0,0,1,0.3}) end},
  {key='down',  action=function() wf.toGrid({0,0.7,1,0.3}) end},
  {key='space', action=wf.toggleMaximize},
})

-- smartLaunch needs to hook into hyper
sl.init(hyper)

-- Last, show a notification that the config is finished loading
hs.notify.new({title='Hammerspoon', subTitle='Configuration loaded'}):send()
