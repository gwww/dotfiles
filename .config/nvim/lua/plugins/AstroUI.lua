-- Config Docs: https://github.com/AstroNvim/astroui#%EF%B8%8F-configuration
return {
  {
    "AstroNvim/astroui",
    opts = {
      colorscheme = "nordfox",
      highlights = { nordfox = { CursorLine = { bg = "#23262f" } } },
      status = { separators = { left = { "", " " }, right = { " ", "" } } },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      palettes = { nordfox = { bg1 = "#1e2129" } },
    },
  },
}
