require("caffeine")
require("window-fns")
HyperKey = require("hyper")

HyperKey:init("rightCtrl", {
  -- App launch...
  a = function() hs.application.launchOrFocus( "Forklift" ) end,
  c = caffeinate,
  f = function() hs.application.launchOrFocus( "Finder" ) end,
  h = function() os.execute( "open ~" ) end,
  q = function() hs.application.launchOrFocus( "Firefox" ) end,
  s = function() hs.application.launchOrFocus( "Slack" ) end,
  v = function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end,
  w = function() hs.application.launchOrFocus( "iTerm" ) end,
  y = hs.toggleConsole,
  z = function() hs.application.launchOrFocus( "zoom.us" ) end,

  -- Window movements...
  left  = cycleCalls(toGrid, {{0,0,0.5,1},   {0,0,2/3,1},   {0,0,1/3,1}}),
  right = cycleCalls(toGrid, {{0.5,0,0.5,1}, {1/3,0,2/3,1}, {2/3,0,1/3,1}}),
  up    = function() toGrid({0,0,1,0.3}) end,
  down  = function() toGrid({0,0.7,1,0.3}) end,
  space = function() toggleMaximize(hs.window.focusedWindow()) end,
})

-- Finally, show a notification that we finished loading the config
hs.notify.new({title='Hammerspoon', subTitle='Configuration loaded'}):send()
