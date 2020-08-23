local caffeine = hs.menubar.new(false)

if hs.caffeinate.get("displayIdle") then
  caffeine:returnToMenuBar()
  caffeine:setIcon("caffeine-on.pdf")
end

function caffeinate()
  hs.caffeinate.toggle("displayIdle")
  if hs.caffeinate.get("displayIdle") then
    caffeine:returnToMenuBar()
    caffeine:setIcon("caffeine-on.pdf")
    caffeine:setClickCallback(caffeinate)
    hs.alert.show("Staying AWAKE!", 2)
  else
    caffeine:removeFromMenuBar()
    hs.alert.show("Sleepy", 2)
  end
end
