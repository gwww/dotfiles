--- === HyperKey ===
---
--- Map one of the keys: control, alt, command, shift, or fn to be a
--- "hyper" key. When the hyper key is pressed and released without any
--- other keypress in conjunction then an Escape key is generated. When
--- another key is pressed when the hyper key is down then a function is
--- called.
---

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "HyperKey"
obj.version = "0.1"
obj.author = "gwwaters <gwwaters@gmail.com>"
-- obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

local hyperKeyChoices = {} -- {keycode, flag}
hyperKeyChoices.leftCtrl   = {59, "ctrl"}
hyperKeyChoices.rightCtrl  = {62, "ctrl"}
hyperKeyChoices.leftAlt    = {58, "alt"}
hyperKeyChoices.rightAlt   = {61, "alt"}
hyperKeyChoices.leftCmd    = {55, "cmd"}
hyperKeyChoices.rightCmd   = {54, "cmd"}
hyperKeyChoices.leftShift  = {56, "shift"}
hyperKeyChoices.rightShift = {60, "shift"}
hyperKeyChoices.fn         = {63, "fn"}

local function dbg(e)
  local flags = ""
  for k, v in pairs(e:getFlags()) do flags = flags .. k .. ";" end

  print(string.format("Type: %s  Key: %s (%d)  Mods: %x  Flags: '%s'",
    hs.eventtap.event.types[e:getType()],
    hs.keycodes.map[e:getKeyCode()], e:getKeyCode(),
    hs.eventtap.checkKeyboardModifiers(true)["_raw"],
    flags))
end

function obj:init(key, keysToBind)
  local function key_event(event)
    -- dbg(event)
    -- print(obj.hyperKeyPressed, obj.hyperKeyComboPressed)
    if event:getKeyCode() == obj.hyperKey and event:getType() == 12 then
      if event:getFlags()[obj.hyperKeyFlagName] then
        obj.hyperKeyPressed = true
        obj.hyperKeyComboPressed = false
      else
        obj.hyperKeyPressed = false
        if not obj.hyperKeyComboPressed then
          hs.eventtap.keyStroke('', 'escape', 100000)
        end
      end
    elseif obj.hyperKeyPressed and event:getType() == 10 then
      if hs.eventtap.checkKeyboardModifiers()[obj.hyperKeyFlagName] then
        obj.hyperKeyComboPressed = true
        if obj.keyBindings[hs.keycodes.map[event:getKeyCode()]] then
          obj.keyBindings[hs.keycodes.map[event:getKeyCode()]]()
        end
        return true
      end
    end

    return false
  end

  obj.hyperKey = hyperKeyChoices[key][1]
  obj.hyperKeyFlagName = hyperKeyChoices[key][2]
  obj.keyBindings = keysToBind

  obj.hyperKeyPressed = false
  obj.hyperKeyComboPressed = false

  eventTap = hs.eventtap.new(
    {
      hs.eventtap.event.types.keyDown,      -- type 10
      hs.eventtap.event.types.flagsChanged  -- type 12
    }, key_event):start()
end

return obj
