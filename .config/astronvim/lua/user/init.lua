return {
  colorscheme = "default_theme",

  -- Diagnostics configuration for when diagnostics are on
  diagnostics = {
    underline = false,
    update_in_insert = false,
  },

  lsp = {
    on_attach = function(client, bufnr)
      client.config.flags["debounce_text_changes"] = 500
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_del_augroup_by_name(vim.fn.printf("lsp_document_highlight_%d", bufnr))
      end
    end,
  },
}
