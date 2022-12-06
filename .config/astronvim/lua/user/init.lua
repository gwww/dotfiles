return {
  colorscheme = "nightfox",

  -- Diagnostics configuration for when diagnostics are on
  diagnostics = {
    underline = false,
    update_in_insert = false,
  },

  lsp = {
    -- Add to the global LSP on_attach function
    on_attach = function(client) client.config.flags["debounce_text_changes"] = 500 end,
  },
}
