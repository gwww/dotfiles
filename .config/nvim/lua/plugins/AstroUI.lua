-- Config Docs: https://github.com/AstroNvim/astroui#%EF%B8%8F-configuration
local nord_mods = {
  Normal = { bg = "#272b35" },
  SignColumn = { bg = "#272b35" },
  CursorLine = { bg = "#2e3440" },
}

return {
  {
    "AstroNvim/astroui",
    opts = {
      colorscheme = "onenord",
      highlights = {
        nord = nord_mods,
        onenord = nord_mods,
      },
      status = {
        separators = {
          left = { "", " " },
          right = { " ", "" },
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      dim_inactive = { enabled = true, shade = "light", percentage = 0.25 },
    },
  },
  { "gbprod/nord.nvim", lazy = true, priority = 1000 },
  { "rmehri01/onenord.nvim", lazy = true, priority = 1000 },
}
