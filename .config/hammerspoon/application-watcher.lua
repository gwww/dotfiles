-- Watch app events
appWatcher = nil
moveMe = false

function applicationWatcher(appName, eventType, appObject)
  if appName == 'Cisco Webex Meetings' then
    if eventType == hs.application.watcher.launched then
      moveMe = true
    elseif eventType == hs.application.watcher.activated then
      if moveMe then
        moveMe = false
        for i=1, 40 do
          if appObject:mainWindow() then break; end
          hs.timer.usleep(50000)
        end
        appObject:focusedWindow():moveToScreen("Color LCD", false, true, 0)
        appObject:focusedWindow():maximize()
      end
    end
  end
  -- local str = string.format("App Watcher: '%s%s' %d", appName, foo, eventType)
  -- print(str)
end

appWatcher = hs.application.watcher.new(applicationWatcher):start()
