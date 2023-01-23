return {
  "EdenEast/nightfox.nvim",
  opts = function(_, opts)
    local color = require "nightfox.lib.color"
    opts.options = {
      styles = {
        comments = "italic",
      },
    }
    opts.palettes = {
      nightfox = {
        bg1 = color.from_hsl(216, 31, 8):to_css(),
        bg3 = color.from_hsl(216, 31, 12):to_css(),
        comment = "#7687a0",
      },
    }
    opts.groups = {
      nightfox = {
        DiffText = { bg = "darkgreen" },
        IndentBlanklineChar = { fg = "#282828" },
        IndentBlanklineContextChar = { fg = "#3f3f3f" },
      },
    }

    return opts
  end,
}
