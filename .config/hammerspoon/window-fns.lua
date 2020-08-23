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
  if previousSizes[ id ] == nil then
    previousSizes[id] = window:frame()
    window:maximize()
  else
    window:setFrame(previousSizes[id])
    previousSizes[id] = nil
  end

  return window
end
