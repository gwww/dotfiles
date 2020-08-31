local function dbg(e)
  local flags = "'"
  for k, v in pairs(e:getFlags()) do
    flags = flags .. k .. ","
  end
  flags = flags .. "'"

  local s = string.format("Type: %s  Key: %s (%d)  Mods: %x  Flags: %s",
    hs.eventtap.event.types[e:getType()],
    hs.keycodes.map[e:getKeyCode()], e:getKeyCode(),
    hs.eventtap.checkKeyboardModifiers(true)["_raw"],
    flags
  )
  print(s)
end

local eventTap = nil

function hyper_init(keysToBind)
  local hyperKey = 62 -- Const Right control key
  local hyperKeyFlagName = "ctrl" -- Const flag name

  local hyperKeyPressed = false
  local hyperKeyComboPressed = false

  local keyBindings = keysToBind
  eventTap = hs.eventtap.new(
    {
      hs.eventtap.event.types.keyDown,
      hs.eventtap.event.types.flagsChanged
    },
    function (e)
      -- dbg(e)
      if e:getKeyCode() == hyperKey and e:getType() == 12 then
        if e:getFlags()[hyperKeyFlagName] then
          hyperKeyPressed = true
          hyperKeyComboPressed = false
        else
          hyperKeyPressed = false
          if not hyperKeyComboPressed then
            hs.eventtap.keyStroke('', 'escape', 100000)
          end
        end
      elseif hyperKeyPressed and e:getType() == 10 then
        if hs.eventtap.checkKeyboardModifiers()["ctrl"] then
          hyperKeyComboPressed = true
          if keyBindings[hs.keycodes.map[e:getKeyCode()]] then
            keyBindings[hs.keycodes.map[e:getKeyCode()]]()
          end
          return true
        end
      end

      return false
    end
  )
  eventTap:start()
end
