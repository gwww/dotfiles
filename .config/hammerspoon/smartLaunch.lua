-- Roughly inspired by: https://github.com/szymonkaliski/dotfiles

local module = {}
local savedState = {}

module.init = function(hyper)
  hyper.addHook(nil, function() savedState = {} end)
end

module.smartLaunch = function(launchApp, name)
  if savedState.lastApp ~= launchApp then
    savedState = {lastApp = launchApp}
  end

  if not name then name = launchApp end

  local runningApp = hs.application.get(launchApp)

  if not runningApp then
    hs.alert.show("Launching " .. name, 1.2)
    hs.application.open(launchApp)

  else
    if not savedState.windows then
      local wins = hs.fnutils.filter(runningApp:allWindows(), function(win)
        return win:isStandard()
      end)
      savedState.windows = wins
      savedState.index = hs.fnutils.indexOf(wins, hs.window.frontmostWindow()) or 0
    end

    if #savedState.windows == 0 then
      hs.alert.show("Creating new " .. name .. " window", 1.2)
      hs.application.open(launchApp)

    else
      -- focus a window and set window index for next smartLaunch call
      savedState.windows[(savedState.index % #savedState.windows)+1]:focus()
      savedState.index = savedState.index + 1
    end
  end
end

return module
