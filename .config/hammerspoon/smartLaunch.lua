-- Roughly inspired by: https://github.com/szymonkaliski/dotfiles

local module = {}
local savedState = {}

module.init = function(hyper)
  hyper.addHook(nil, function() savedState = {} end)
end

module.smartLaunch = function(launchApp)
  if savedState.lastApp ~= launchApp then
    savedState = {lastApp = launchApp}
  end

  local runningApp = hs.application.get(launchApp)
  if not runningApp then
    hs.application.launchOrFocus(launchApp)

  else
    if not savedState.windows then
      local wins = hs.fnutils.filter(runningApp:allWindows(), function(win)
        return win:isStandard()
      end)
      savedState.windows = wins
      savedState.index = hs.fnutils.indexOf(wins, hs.window.frontmostWindow()) or 0
    end

    if #savedState.windows == 0 then
      hs.application.launchOrFocus(runningApp:name())

    else
      -- focus a window and set window index for next smartLaunch call
      savedState.windows[(savedState.index % #savedState.windows)+1]:focus()
      savedState.index = savedState.index + 1
    end
  end
end

return module
