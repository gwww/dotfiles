local menuBar = hs.menubar.new(false)

local onCaffeine = function()
  menuBar:returnToMenuBar()
  menuBar:setIcon("caffeine-on.pdf")
  menuBar:setClickCallback(caffeinate)
end

if hs.caffeinate.get("displayIdle") then
  onCaffeine()
end

local caffeinate = function()
  hs.caffeinate.toggle("displayIdle")
  if hs.caffeinate.get("displayIdle") then
    onCaffeine()
    hs.alert.show("Staying AWAKE!", 2)
  else
    menuBar:removeFromMenuBar()
    hs.alert.show("Sleepy", 2)
  end
end

return caffeinate
