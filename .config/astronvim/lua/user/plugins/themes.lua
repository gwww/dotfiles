local H = require "user.utils.hsl"

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      dim_inactive = { enabled = true, percentage = 0.25 },
      styles = {
        conditionals = {},
      },
      highlight_overrides = {
        mocha = function(c)
          return {
            Normal = { bg = c.mantle },
            SignColumn = { bg = c.base },
            StatusLine = { bg = c.base },
            Comment = { fg = "#7687a0" },
            WhichkeyFloat = { bg = "#052457" },
            WinBar = { bg = "#052457" },
            ["@tag.attribute"] = { style = {} },
            ["@parameter"] = { style = {} },
          }
        end,
      },
    },
  },

  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
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
