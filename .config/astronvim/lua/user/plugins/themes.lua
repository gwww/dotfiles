local H = require "user.utils.hsl"

return {
  {
    "AstroNvim/astrotheme",
    -- lazy = false,
    priority = 1000,
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
  },

  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        styles = {
          comments = "italic",
        },
      },
      palettes = {
        nightfox = {
          bg1 = H.hslToHex(216, 31, 8),
          bg3 = H.hslToHex(216, 31, 12),
          comment = "#7687a0",
        },
      },
      groups = {
        nightfox = {
          DiffText = { bg = "darkgreen" },
          IndentBlanklineChar = { fg = "#282828" },
          IndentBlanklineContextChar = { fg = "#3f3f3f" },
        },
      },
    },
  },
}
