--
-- Supports:
--   - Escape when hyper pressed then released without any bindings being invoked
--   - Hyper+key invokes function
--   - Hooks for when hyper key pressed and released
--
-- Ideas for `hyper` came from: https://github.com/evantravers/hammerspoon-config
--

local module = {}

module.init = function(modal_key)
  module._pressed = function()
    module._modal:enter()
    module._presses = 0
    hs.fnutils.each(module._press_hooks, function(hook) hook() end)
  end

  module._released = function()
    module._modal:exit()
    if module._presses == 0 then
      hs.eventtap.keyStroke('', 'escape', 100000)
    else
      module._presses = 0
    end
    hs.fnutils.each(module._release_hooks, function(hook) hook() end)
  end

  module._presses = 0
  module._modal = hs.hotkey.modal.new({}, nil)
  module._press_hooks = {}
  module._release_hooks = {}
  hs.hotkey.bind({}, modal_key, module._pressed, module._released)
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
