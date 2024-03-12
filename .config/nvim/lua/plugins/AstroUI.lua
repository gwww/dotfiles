-- Config Docs: https://github.com/AstroNvim/astroui#%EF%B8%8F-configuration
local base, mantle = "#1e2129", "#23262f"
local color_mods = { Normal = { bg = base }, SignColumn = { bg = base }, CursorLine = { bg = "#23262f" } }

return {
  {
    "AstroNvim/astroui",
    opts = {
      colorscheme = "catppuccin-mocha",
      highlights = {
        nord = color_mods,
        onenord = color_mods,
      },
      status = { separators = { left = { "", " " }, right = { " ", "" } } },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      dim_inactive = { enabled = true, shade = "light", percentage = 0.25 },
      color_overrides = { mocha = { base = base, mantle = mantle, crust = "#474747" } },
    },
  },
  { "gbprod/nord.nvim", lazy = true, priority = 1000 },
  { "rmehri01/onenord.nvim", lazy = true, priority = 1000 },
}
