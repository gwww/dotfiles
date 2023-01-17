return {
  colorscheme = "default_theme",

  diagnostics = {
    underline = false,
    update_in_insert = false,
  },

  highlights = {
    init = {
      NeoTreeTitleBar = { fg = "#cccccc" }
    }
  },

  default_theme = require("user.astronvim_theme"),
  heirline = require("user.heirline"),
  lsp = require("user.lsp"),

  luasnip = {
    vscode = {
      paths = {
        "~/.config/astronvim/lua/user/snippets",
      },
    },
  },

  -- updater = {
  --   channel = "nightly",
  -- },
}
