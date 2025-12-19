return {
  {
    -- Config Docs: https://github.com/AstroNvim/astrolsp#%EF%B8%8F-configuration
    "AstroNvim/astrolsp",
    opts = {
      config = {
        ruff = {
          on_attach = function(client) client.server_capabilities.hoverProvider = false end,
          init_options = {
            settings = {
              -- Disable linting to use Ruff exclusively as a formatter
              lint = { enable = false },
            },
          },
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "lua-language-server",
        "prettier",
        -- "pyright",
        "ty",
        "ruff",
        "stylua",
        -- "svelte-language-server",
        -- "tailwindcss-language-server",
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
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      },
    },
  },
}
