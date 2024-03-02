return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "html",
        -- "jsonls",
        "pyright",
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
        "black",
        "isort",
        "prettier",
        "stylua",
      })
    end,
  },

  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   -- overrides `require("mason-nvim-dap").setup(...)`
  --   opts = function(_, opts)
  --     -- add more things to the ensure_installed table protecting against community packs modifying it
  --     opts.ensure_installed = require("astrocore").list_insert_unique(
  --       opts.ensure_installed,
  --       "python"
  --       -- add more arguments for adding more debuggers
  --     )
  --   end,
  -- },
}
