H = require "user.utils.hsl"
return function(hl)
  hl.CursorLine.bg = H.hslToHex(216, 31, 12)
  hl.Comment.italic = true
  hl.IndentBlanklineChar.fg = "#282828"
  hl.IndentBlanklineContextChar.fg = "#3f3f3f"
  hl.IncSearch.bg = "#24450d"
  return hl
end
