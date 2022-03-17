local nightfox = require("nightfox")

nightfox.setup {
  fox = "nightfox",
  styles = {
    comments = "italic",
    -- keywords = "bold",
    -- functions = "italic,bold",
  },
  options = {
  },
  colors = {
    bg = "#111720",
    bg_highlight = "#131a24",
  },
  hlgroups = {
  },
}

-- vim.cmd "colorscheme nightfox"
nightfox.load()
