local menuBar = hs.menubar.new(false)

if hs.caffeinate.get("displayIdle") then
  menuBar:returnToMenuBar()
  menuBar:setIcon("caffeine-on.pdf")
end

local caffeinate = function()
  hs.caffeinate.toggle("displayIdle")
  if hs.caffeinate.get("displayIdle") then
    menuBar:returnToMenuBar()
    menuBar:setIcon("caffeine-on.pdf")
    menuBar:setClickCallback(caffeinate)
    hs.alert.show("Staying AWAKE!", 2)
  else
    menuBar:removeFromMenuBar()
    hs.alert.show("Sleepy", 2)
  end
end

return caffeinate
