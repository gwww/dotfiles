-- Setup
hs.window.animationDuration = .1

-- Cycle args for function when called repeatedly
-- e.g: cycleCalls(fn, {{args1...}, ... })
function cycleCalls(fn, args)
  local argIndex = 0
  return function()
    argIndex = argIndex + 1
    if (argIndex > #args) then
      argIndex = 1;
    end
    fn(args[argIndex]);
  end
end

-- This method used to place a window to a position and size on the screen by using
-- four floats instead of pixel sizes. Returns the window instance. Examples:
--   windowToGrid(window, 0, 0, 0.25, 0.5);  -- top-left, width: 25%, height: 50%
--   windowToGrid(someWindow, 0.3, 0.2, 0.5, 0.35); top: 30%, left: 20%, width: 50%, height: 35%
function windowToGrid(window, rect)
  if not window then
    return window
  end

  local screen = hs.screen.mainScreen():fullFrame()
  window:setFrame({
    x = math.floor(rect[1] * screen.w + .5) + screen.x,
    y = math.floor(rect[2] * screen.h + .5) + screen.y,
    w = math.floor(rect[3] * screen.w + .5),
    h = math.floor(rect[4] * screen.h + .5)
  })
  return window
end

function toGrid(x, y, w, h)
  windowToGrid(hs.window.focusedWindow(), x, y, w, h);
end

-- Toggle between full screen and orginal size. Returns the window instance.
local previousSizes = {}
function toggleMaximize(window)
  if not window then
    return window
  end

  local id = window:id()
  if previousSizes[id] == nil then
    previousSizes[id] = window:frame()
    window:maximize()
  else
    window:setFrame(previousSizes[id])
    previousSizes[id] = nil
  end

  return window
end

function toggleFullscreen()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  win:toggleFullScreen()
end

function moveWindowScreen(window, direction)
  if not window then
    return window
  end

  if direction == "East" then
    window:moveOneScreenEast(false, false, 0)
  else
    window:moveOneScreenWest(false, false, 0)
  end
end

-- Useful helper function for making hs.layout layouts, from @cmsj
function createWindowLayout(name)
  local layout = string.format("%s = {\n", name)
  local wins = hs.window.allWindows()
  for _,win in ipairs(wins) do
    local app = win:application():name()
    local winTitle = win:title()
    local screen = win:screen():name()
    local frame = win:frame()
    local row = string.format('{"%s", "%s", "%s", nil, hs.geometry.rect(%i, %i, %i, %i), nil},\n', app, winTitle, screen, frame.x, frame.y, frame.w, frame.h)
    layout = layout .. row
  end
  layout = layout .. "\n}"
  print(layout)
end

function forceFocus(win)
  -- this flickers
  -- win:application():activate()
  win:becomeMain()
  win:raise():focus()
end

-- smart app launch or focus or cycle windows
-- From: https://github.com/szymonkaliski/dotfiles
function smartLaunchOrFocus(launchApps)
  local frontmostWindow = hs.window.frontmostWindow()
  local runningWindows  = {}

  launchApps = type(launchApps) == 'table' and launchApps or { launchApps }

  -- filter running applications by apps array
  local runningApps = hs.fnutils.map(launchApps, function(launchApp)
    return hs.application.get(launchApp)
  end)

  -- create table of sorted windows per application
  hs.fnutils.each(runningApps, function(runningApp)
    local standardWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
      return win:isStandard()
    end)

    -- concat with all running windows
    hs.fnutils.concat(runningWindows, standardWindows);
  end)

  if #runningApps == 0 then
    -- if no apps are running then launch first one in list
    hs.application.launchOrFocus(launchApps[1])
  elseif #runningWindows == 0 then
    -- if some apps are running, but no windows - force create one
    hs.application.launchOrFocus(runningApps[1]:name())
  else
    -- check if one of windows is already focused
    local currentIndex = hs.fnutils.indexOf(runningWindows, frontmostWindow)
    if not currentIndex then currentIndex = 0 end
    forceFocus(runningWindows[(currentIndex % #runningWindows)+1])
  end
end
