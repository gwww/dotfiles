--
-- Ideas for `hyper` key from: https://github.com/evantravers/hammerspoon-config
--
-- Supports Escape when hyper key is pressed and released without any
-- bindings being invoked.

local hyper = {}

function hyper.init(modal_key, mappings)
  function hyper._pressed()
    hyper._modal:enter()
    hyper._presses = 0
  end

  function hyper._released()
    hyper._modal:exit()
    if hyper._presses == 0 then
      hs.eventtap.keyStroke('', 'escape', 100000)
    else
      hyper._presses = 0
    end
  end

  hyper._presses = 0
  hyper._modal = hs.hotkey.modal.new({}, nil)
  hs.hotkey.bind({}, modal_key, hyper._pressed, hyper._released)

  hs.fnutils.map(mappings, function(mapping)
    hyper._modal:bind(mapping.modifiers, mapping.key,
      function()
        hyper._presses = hyper._presses + 1
        mapping.action()
      end
    )
  end)
end

return hyper
