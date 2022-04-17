--
-- Supports:
--   - Hyper+key invokes function
--   - Hooks for when hyper key pressed and/or released
--     - Hook can be use to generate a key, for example escape
--
-- Ideas for `hyper` came from: https://github.com/evantravers/hammerspoon-config
--

local M = {}

-- Helper
M.escape = function(presses)
    if presses == 0 then
        hs.eventtap.keyStroke("", "escape", 100000)
    end
end

M.init = function(modal_key)
    local modalPressed = function()
        M._modal:enter()
        M._presses = 0
        hs.fnutils.each(M._press_hooks, function(hook)
            hook()
        end)
    end

    local modalReleased = function()
        M._modal:exit()
        hs.fnutils.each(M._release_hooks, function(hook)
            hook(M._presses)
        end)
    end

    M._presses, M._press_hooks, M._release_hooks = 0, {}, {}
    M._modal = hs.hotkey.modal.new({}, nil)
    hs.hotkey.bind({}, modal_key, modalPressed, modalReleased)
end

M.addHook = function(press, release)
    if press then
        table.insert(M._press_hooks, press)
    end
    if release then
        table.insert(M._release_hooks, release)
    end
end

M.bind = function(bindings)
    bindings = bindings.key and { bindings } or bindings
    hs.fnutils.map(bindings, function(binding)
        M._modal:bind(binding.modifiers, binding.key, function()
            M._presses = M._presses + 1
            binding.action()
        end)
    end)
end

return M
