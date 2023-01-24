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

  luasnip = {
    vscode = {
      paths = {
        "~/.config/astronvim/lua/user/snippets",
      },
    },
  },
  heirline = require "user.heirline",
  lsp = require "user.lsp",

  -- updater = {
  --   channel = "nightly",
  -- },
}
