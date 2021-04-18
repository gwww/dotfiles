--
-- Supports:
--   - Escape when hyper pressed then released without any bindings being invoked
--   - Hyper+key invokes function
--   - Hooks for when hyper key pressed and/or released
--
-- Ideas for `hyper` came from: https://github.com/evantravers/hammerspoon-config
--

local module = {}

-- Helper
module.escape = function(count)
  if count == 0 then hs.eventtap.keyStroke('', 'escape', 100000) end
end

module.init = function(modal_key)
  local modalPressed = function()
    module._modal:enter()
    module._presses = 0
    hs.fnutils.each(module._press_hooks, function(hook) hook() end)
  end

  local modalReleased = function()
    module._modal:exit()
    hs.fnutils.each(module._release_hooks, function(hook) hook(module._presses) end)
  end

  module._presses, module._press_hooks, module._release_hooks = 0, {}, {}
  module._modal = hs.hotkey.modal.new({}, nil)
  hs.hotkey.bind({}, modal_key, modalPressed, modalReleased)
end

module.addHook = function(press, release)
  if press then table.insert(module._press_hooks, press) end
  if release then table.insert(module._release_hooks, release) end
end

module.bind = function(bindings)
  bindings = bindings.key and {bindings} or bindings
  hs.fnutils.map(bindings, function(binding)
    module._modal:bind(binding.modifiers, binding.key,
      function()
        module._presses = module._presses + 1
        binding.action()
      end
    )
  end)
end

return module
