--
-- Ideas for `hyper` came from: https://github.com/evantravers/hammerspoon-config
--
-- Supports Escape when hyper key is pressed and released without any
-- bindings being invoked.

local module = {}

module.init = function(modal_key)
  module._pressed = function()
    module._modal:enter()
    module._presses = 0
  end

  module._released = function()
    module._modal:exit()
    if module._presses == 0 then
      hs.eventtap.keyStroke('', 'escape', 100000)
    else
      module._presses = 0
    end
  end

  module._presses = 0
  module._modal = hs.hotkey.modal.new({}, nil)
  hs.hotkey.bind({}, modal_key, module._pressed, module._released)
end

module.bind = function(bindings)
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
