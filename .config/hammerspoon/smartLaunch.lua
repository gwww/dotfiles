local savedWindows = {}

local forceFocus = function(win)
  -- this flickers
  -- win:application():activate()
  win:becomeMain()
  win:raise():focus()
end

smartLaunchInit = function(hyper)
  hyper.addHook(nil, function() savedWindows = {} end)
end

-- Roughly inspired by: https://github.com/szymonkaliski/dotfiles
smartLaunch = function(launchApp)
  local runningApp = hs.application.get(launchApp)

  if not runningApp then
    -- if app is not running then launch it
    hs.application.launchOrFocus(launchApp)
  else
    local allWindows = {}
    local index = 0

    if savedWindows[launchApp] then
      index = savedWindows[launchApp][1]
      allWindows = savedWindows[launchApp][2]
    else
      allWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
        return win:isStandard()
      end)
      savedWindows[launchApp] = {1, allWindows}

      index = hs.fnutils.indexOf(allWindows, hs.window.frontmostWindow())
      if not index then index = 0 end
    end

    if #allWindows == 0 then
      -- if no windows, force create one
      hs.application.launchOrFocus(runningApp:name())

    else
      -- focus one of the windows
      forceFocus(allWindows[(index % #allWindows)+1])
      savedWindows[launchApp][1] = index + 1
    end
  end
end
