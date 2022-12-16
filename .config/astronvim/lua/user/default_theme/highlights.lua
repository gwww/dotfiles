H = require "user.utils.hsl"
return function(hl)
  hl.CursorLine.bg = H.hslToHex(216, 31, 12)
  hl.Comment.italic = true
  hl.IndentBlanklineChar.fg = "#282828"
  -- hl.IndentBlanklineChar.fg = "#173b14"
  hl.IndentBlanklineContextChar.fg = "#3f3f3f"
  return hl
end
