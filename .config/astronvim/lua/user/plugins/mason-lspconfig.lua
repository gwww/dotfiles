-- List of valid "ensure_installed" items.
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/mappings/server.lua
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "html",
        -- "jsonls",
        "pyright",
        "lua_ls",
        "svelte",
        "tailwindcss",
        "tsserver",
        "yamlls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "black",
        "isort",
      },
    },
  },
}
