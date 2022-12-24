return {
  colorscheme = "default_theme",

  diagnostics = {
    underline = false,
    update_in_insert = false,
  },

  default_theme = require("user.astronvim_theme"),
  heirline = require("user.heirline"),
  lsp = require("user.lsp"),

  -- updater = {
  --   channel = "nightly",
  -- },
}
