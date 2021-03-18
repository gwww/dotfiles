savedWindows = {}
last_key_timer = nil

last_key_fn = function()
  -- time is temporary hack until hyper key release hook implemented
  savedWindows = {}
  last_key_timer = nil
  print("smartLaunch cache expire")
end

-- Inspired by: https://github.com/szymonkaliski/dotfiles
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
      local allWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
        return win:isStandard()
      end)
      savedWindows[launchApp] = {1, allWindows}

      index = hs.fnutils.indexOf(allWindows, hs.window.frontmostWindow())
      print("inside if", index, hs.inspect(allWindows))
      if not index then index = 0 end
    end

    print("after if", index, hs.inspect(allWindows))

    if #allWindows == 0 then
      -- if no windows, force create one
      hs.application.launchOrFocus(runningApp:name())

    else
      -- focus one of the windows
      -- table.insert(t, #t, table.remove(t, 1))

      -- if window from the app is already in focus
      forceFocus(allWindows[(index % #allWindows)+1])
      savedWindows[launchApp][1] = index + 1
      if last_key_timer then last_key_timer:stop() end
      last_key_timer = hs.timer.doAfter(3, last_key_fn)
    end
  end
end
