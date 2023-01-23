return {
  colorscheme = "astronvim",

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
  astronvim_theme = require "user.astronvim_theme",
  heirline = require "user.heirline",
  lsp = require "user.lsp",

  -- updater = {
  --   channel = "nightly",
  -- },
}
