return {
  {
    -- Config Docs: https://github.com/AstroNvim/astrolsp#%EF%B8%8F-configuration
    "AstroNvim/astrolsp",
    opts = {
      config = {
        ruff = { on_attach = function(client) client.server_capabilities.hoverProvider = false end },
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "html",
        "pyright",
        "lua_ls",
        "ruff",
        "svelte",
        "tailwindcss",
        "tsserver",
        "yamlls",
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
      })
      opts.ensure_installed = vim.tbl_filter(
        function(v) return not vim.tbl_contains({ "black", "isort" }, v) end,
        opts.ensure_installed
      )
    end,
  },

  {
    "stevearc/conform.nvim",
    -- optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
      },
    },
  },
}
