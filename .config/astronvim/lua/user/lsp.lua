return {
  on_attach = function(client)
    if client.server_capabilities.documentHighlightProvider then
      -- Turn of highlight of symbol under cursor
      vim.api.nvim_del_augroup_by_name "lsp_document_highlight"
    end
  end,
  formatting = { disabled = { "lua_ls" } },
}
