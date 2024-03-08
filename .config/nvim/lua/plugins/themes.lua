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
    "gbprod/nord.nvim",
    opts = {
      on_highlights = function(highlights, colors)
        highlights.Normal.bg = "#272b35"
        highlights.SignColumn.bg = "#272b35"
        highlights.CursorLine.bg = "#2e3440"
        highlights.CursorLine.bg = "#313844"
      end,
    },
  },
}
