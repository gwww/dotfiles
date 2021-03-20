local module = {}

local savedWindows = {}

local forceFocus = function(win)
  win:becomeMain()
  win:raise():focus()
end

module.init = function(hyper)
  hyper.addHook(nil, function() savedWindows = {} end)
end

-- Roughly inspired by: https://github.com/szymonkaliski/dotfiles
module.smartLaunch = function(launchApp)
  local runningApp = hs.application.get(launchApp)

  if savedWindows.lastApp ~= launchApp then
    savedWindows = {lastApp = launchApp}
  end

  if not runningApp then
    -- if app is not running then launch it
    hs.application.launchOrFocus(launchApp)

  else
    local allWindows = {}
    local index = 0

    if savedWindows.windows then
      index = savedWindows.index
      allWindows = savedWindows.windows

    else
      allWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
        return win:isStandard()
      end)
      savedWindows = {windows = allWindows}
      index = hs.fnutils.indexOf(allWindows, hs.window.frontmostWindow()) or 0
    end

    if #allWindows == 0 then
      -- if no windows, force create one
      hs.application.launchOrFocus(runningApp:name())

    else
      -- focus one of the windows
      forceFocus(allWindows[(index % #allWindows)+1])
      savedWindows.index = index + 1
    end
  end
end

return module
