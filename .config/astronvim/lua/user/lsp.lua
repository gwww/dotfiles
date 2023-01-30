return {
  on_attach = function(client)
    -- client.config.flags["debounce_text_changes"] = 500
    if client.server_capabilities.documentHighlightProvider then
      -- Turn of highlight of symbol under cursor
      vim.api.nvim_del_augroup_by_name "lsp_document_highlight"
    end
  end,
}
