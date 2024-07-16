return {
  {
    -- Config Docs: https://github.com/AstroNvim/astrolsp#%EF%B8%8F-configuration
    "AstroNvim/astrolsp",
    "stevearc/conform.nvim",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "html",
        "lua_ls",
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
    end,
  },
}
