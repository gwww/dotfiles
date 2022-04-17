-- Watch app events
local appWatcher = nil
local moveMe = false

local applicationWatcher = function(appName, eventType, appObject)
    if appName == "Cisco Webex Meetings" then
        -- always place the WebEx meeting window on screen with camera
        if eventType == hs.application.watcher.launched then
            moveMe = true
        elseif eventType == hs.application.watcher.activated then
            if moveMe then
                moveMe = false
                for _ = 1, 40 do
                    if appObject:mainWindow() then
                        break
                    end
                    hs.timer.usleep(50000) -- dumb to block; but simple and works well enough
                end
                appObject:focusedWindow():moveToScreen("Built%-in Retina Display", false, true, 0)
                appObject:focusedWindow():maximize(0)
            end
        end
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher):start()

return appWatcher
