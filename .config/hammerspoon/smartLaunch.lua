-- Roughly inspired by: https://github.com/szymonkaliski/dotfiles

local m = {}
m._savedState = {}

m.init = function(hyper)
  hyper.addHook(nil, function() m._savedState = {} end)
end

m.smartLaunch = function(launchApp, name)
  if m._savedState.lastApp ~= launchApp then
    m._savedState = {lastApp = launchApp}
  end

  if not name then name = launchApp end

  local runningApp = hs.application.get(launchApp)

  if not runningApp then
    hs.alert.show("Launching " .. name, 1.2)
    hs.application.open(launchApp)

  else
    if not m._savedState.windows then
      local windows = hs.fnutils.filter(runningApp:allWindows(), function(win)
        return win:isStandard()
      end)
      m._savedState.windows = windows
      m._savedState.index = hs.fnutils.indexOf(windows, hs.window.frontmostWindow()) or 0
    end

    if #m._savedState.windows == 0 then
      hs.alert.show("Creating new " .. name .. " window", 1.2)
      hs.application.open(launchApp)

    else
      -- focus a window and set window index for next smartLaunch call
      m._savedState.windows[(m._savedState.index % #m._savedState.windows)+1]:focus()
      m._savedState.index = m._savedState.index + 1
    end
  end
end

return m
