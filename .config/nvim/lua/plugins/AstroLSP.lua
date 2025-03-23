return {
  {
    -- Config Docs: https://github.com/AstroNvim/astrolsp#%EF%B8%8F-configuration
    "AstroNvim/astrolsp",
    opts = {
      config = {
        ruff = {
          on_attach = function(client) client.server_capabilities.hoverProvider = false end,
          init_options = { settings = { lint = { enable = false } } },
        },
        pyright = { settings = { pyright = { disableOrganizeImports = true } } },
      },
      -- formatting = { format_on_save = { ignore_filetypes = { "lua" } } },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "lua-language-server",
        "prettier",
        "pyright",
        "ruff",
        "stylua",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = { lsp_format = "fallback" },
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
      },
    },
  },
}
