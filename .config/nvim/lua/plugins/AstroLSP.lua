-- Config Docs: https://github.com/AstroNvim/astrolsp#%EF%B8%8F-configuration

return {
  "AstroNvim/astrolsp",
  opts = {
    -- vim.diagnostics.config({...}))
    diagnostics = {
      underline = false,
      update_in_insert = false,
    },

    -- formatting = {
    --   disabled = {
    --     "lua_ls",
    --   },
    -- },

    -- on_attach = function(client, _)
    --   if client.server_capabilities.documentHighlightProvider then
    --     -- Turn off highlight of symbol under cursor
    --     vim.api.nvim_del_augroup_by_name "lsp_document_highlight"
    --   end
    -- end,
  },
}
