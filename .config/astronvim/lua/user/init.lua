return {
  colorscheme = "astrodark",

  diagnostics = {
    underline = false,
    update_in_insert = false,
  },

  highlights = {
    init = {
      NeoTreeTitleBar = { fg = "#cccccc" },
    },
  },

  heirline = require "user.heirline",
  lsp = require "user.lsp",

  updater = {
    channel = "nightly",
    branch = "v3",
    pin_plugins = true,
  },
}
