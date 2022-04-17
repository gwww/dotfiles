local M = {}

-- Setup
hs.window.animationDuration = 0.1

-- Cycle args for function when called repeatedly
M.cycleCalls = function(fn, args)
    local argIndex = 0
    return function()
        argIndex = argIndex + 1
        if argIndex > #args then
            argIndex = 1
        end
        fn(args[argIndex])
    end
end

-- Place window at x, y, w, h position and size on the screen.
M.toGrid = function(rect)
    local window = hs.window.focusedWindow()
    if not window then
        return nil
    end

    local screen = hs.screen.mainScreen():fullFrame()
    return window:setFrame({
        x = math.floor(rect[1] * screen.w + 0.5) + screen.x,
        y = math.floor(rect[2] * screen.h + 0.5) + screen.y,
        w = math.floor(rect[3] * screen.w + 0.5),
        h = math.floor(rect[4] * screen.h + 0.5),
    })
end

-- Toggle between full screen and orginal size. Returns the window instance.
local previousSizes = {}
M.toggleMaximize = function()
    local window = hs.window.focusedWindow()
    if not window then
        return nil
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

M.moveScreen = function(direction)
    local window = hs.window.focusedWindow()
    if not window then
        return nil
    end

    if direction == "East" then
        window:moveOneScreenEast(false, false, 0)
    else
        window:moveOneScreenWest(false, false, 0)
    end

    return window
end

-- Useful helper function for making hs.layout layouts, from @cmsj
M.createWindowLayout = function(name)
    local layout = string.format("%s = {\n", name)
    local wins = hs.window.allWindows()
    for _, win in ipairs(wins) do
        local app = win:application():name()
        local winTitle = win:title()
        local screen = win:screen():name()
        local frame = win:frame()
        local row = string.format(
            '{"%s", "%s", "%s", nil, hs.geometry.rect(%i, %i, %i, %i), nil},\n',
            app,
            winTitle,
            screen,
            frame.x,
            frame.y,
            frame.w,
            frame.h
        )
        layout = layout .. row
    end
    layout = layout .. "\n}"
    print(layout)
end

return M
