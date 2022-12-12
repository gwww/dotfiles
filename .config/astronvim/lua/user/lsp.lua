return {
  on_attach = function(client, bufnr)
    -- client.config.flags["debounce_text_changes"] = 500
    if client.server_capabilities.documentHighlightProvider then
      -- Turn of highlight of symbol under cursor
      vim.api.nvim_del_augroup_by_name(vim.fn.printf("lsp_document_highlight_%d", bufnr))
    end
  end,

  ["server-settings"] = {
    ["sumneko_lua"] = {
      settings = {
        Lua = {
          workspace = {
            -- These two libs give lots of useful vim symbols
            library = {
              vim.fn.expand "$VIMRUNTIME",
              require("neodev.config").types(),
            },
            checkThirdParty = false,
            maxPreload = 5000,
            preloadFileSize = 10000,
          },
        },
      },
    },
  },
}
