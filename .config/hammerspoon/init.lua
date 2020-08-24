require("caffeine")
require("hyper")
require("window-fns")

hotkeys = {}
  -- App launch...
  hotkeys.c = caffeinate
  hotkeys.f = function() hs.application.launchOrFocus( "Forklift" ) end
  hotkeys.g = function() hs.application.launchOrFocus( "Finder" ) end
  hotkeys.h = function() os.execute( "open ~" ) end
  hotkeys.q = function() hs.application.launchOrFocus( "Firefox" ) end
  hotkeys.V = function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end
  hotkeys.w = function() hs.application.launchOrFocus( "iTerm" ) end
  hotkeys.y = hs.toggleConsole

  -- Window movements...
  hotkeys.left  = cycleCalls(toGrid, {{0,0,0.5,1},   {0,0,2/3,1},   {0,0,1/3,1}})
  hotkeys.right = cycleCalls(toGrid, {{0.5,0,0.5,1}, {1/3,0,2/3,1}, {2/3,0,1/3,1}})
  hotkeys.up    = function() toGrid({0,0,1,0.3}) end
  hotkeys.down  = function() toGrid({0,0.7,1,0.3}) end
  hotkeys.space = function() toggleMaximize(hs.window.focusedWindow()) end
hyper_init(hotkeys)

-- Finally, show a notification that we finished loading the config
hs.notify.new({title='Hammerspoon', subTitle='Configuration loaded'}):send()
