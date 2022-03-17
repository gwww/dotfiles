require("nightfox").setup {
  options = {
    styles = {
      comments = "italic",
      -- keywords = "bold",
      -- functions = "italic,bold",
    },
  },
  pallets = {
    nightfox = {
      bg1 = "#111720",
      bg3 = "#1b2533",
    },
  },
  groups = {
  },
}

vim.cmd "colorscheme nightfox"
