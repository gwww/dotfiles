local color = require "nightfox.lib.color"

require("nightfox").setup {
  options = {
    styles = {
      comments = "italic",
    },
  },
  palettes = {
    nightfox = {
      bg1 = color.from_hsl(216, 31, 8):to_css(),
      bg3 = color.from_hsl(216, 31, 12):to_css(),
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
}
