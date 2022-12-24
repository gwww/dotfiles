H = require "user.utils.hsl"

return {
  colors = {
    bg = H.hslToHex(216, 31, 8),
    purple = "#f3ddb7",
    red = "#A6FCFF",
  },

  highlights = function(hl)
    hl.CursorLine.bg = H.hslToHex(216, 31, 12)
    hl.Comment.italic = true
    hl.IndentBlanklineChar.fg = "#282828"
    hl.IndentBlanklineContextChar.fg = "#3f3f3f"
    return hl
  end
}
