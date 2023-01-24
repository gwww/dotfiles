H = require "user.utils.hsl"

return {
  "AstroNvim/astrotheme",
  -- lazy = false,
  opts = {
    terminal_colors = false,
    palette = {
      astrodark = {
        bg = H.hslToHex(216, 31, 8),
        purple = "#f3ddb7",
        red = "#A6FCFF",
      }
    },

    highlights = {
      astrodark = {
        Comment = { italic = true },
        CursorLine = { bg = H.hslToHex(216, 31, 12) },
      }
    },
  },
}
