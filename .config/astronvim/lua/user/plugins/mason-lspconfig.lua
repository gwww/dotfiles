return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "html",
      "jsonls",
      "pyright",
      "sumneko_lua",
      "svelte",
      "tsserver",
      "yamlls",
    },
  },
}
