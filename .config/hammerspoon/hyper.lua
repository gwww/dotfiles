function hyper_init(keysToBind)
  local hyperKey = 62 -- Const Right control key
  local hyperKeyFlagName = "ctrl" -- Const flag name

  local hyperKeyPressed = false
  local hyperKeyComboPressed = false
  local keyBindings = keysToBind

  local eventTap = hs.eventtap.new(
    {
      hs.eventtap.event.types.keyDown,
      hs.eventtap.event.types.flagsChanged
    },
    function (e)
      -- print("Type: ", e:getType(), "Key code: ", e:getKeyCode(),
      --   "Flags: ", tprint(e:getFlags()))
      if e:getType() == 12 and e:getKeyCode() == hyperKey then
        if e:getFlags()[hyperKeyFlagName] then
          hyperKeyPressed = true
          hyperKeyComboPressed = false
        else
          hyperKeyPressed = false
          if not hyperKeyComboPressed then
            hs.eventtap.keyStroke('', 'escape')
          end
        end
      elseif hyperKeyPressed and e:getType() == 10 then
        if hs.eventtap.checkKeyboardModifiers(true)["_raw"] == 0x40000 then
          hyperKeyComboPressed = true
          if keyBindings[hs.keycodes.map[e:getKeyCode()]] then
            keyBindings[hs.keycodes.map[e:getKeyCode()]]()
          end
          return true
        else
          return false
        end
      end
    end
  )
  eventTap:start()
end
