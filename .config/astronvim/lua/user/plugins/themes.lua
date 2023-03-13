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
}
