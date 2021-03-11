--
-- Supports:
--   - Escape when hyper key pressed/released without any bindings being invoked
--   - Hyper+key invokes function
--   - Hyper press and held invokes function
--
-- Ideas for `hyper` came from: https://github.com/evantravers/hammerspoon-config
--

local module = {}

local function hold_key_fn()
  if module._presses == 0 then
    module._hold_key_fn()
    module._presses = module._presses + 1
  end
end

module.init = function(modal_key, hold_key_function, hold_key_timeout)
  module._pressed = function()
    module._modal:enter()
    module._presses = 0
    if module._hold_key_fn then
      module._hold_key_timer = hs.timer.doAfter(module._hold_key_timeout, hold_key_fn)
    end
  end

  module._released = function()
    module._modal:exit()
    if module._presses == 0 then
      hs.eventtap.keyStroke('', 'escape', 100000)
    else
      module._presses = 0
    end
    if module._hold_key_timer then
      module._hold_key_timer:stop()
    end
  end

  module._presses = 0
  module._modal = hs.hotkey.modal.new({}, nil)
  module._hold_key_fn = hold_key_function
  if hold_key_timeout then
    module._hold_key_timeout = hold_key_timeout
  else
    module._hold_key_timeout = 1.5
  end
  hs.hotkey.bind({}, modal_key, module._pressed, module._released)
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
