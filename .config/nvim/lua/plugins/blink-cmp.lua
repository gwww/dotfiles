return {
  "Saghen/blink.cmp",
  event = "InsertEnter",
  version = "v0.*",
  dependencies = { "rafamadriz/friendly-snippets" },

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    --- @diagnostic disable: missing-fields
    keymap = {
      preset = "super-tab",
    },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
    },
    signature = {
      window = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
  specs = {
    -- disable built in completion plugins
    { "hrsh7th/nvim-cmp", enabled = false },
    { "rcarriga/cmp-dap", enabled = false },
    { "L3MON4D3/LuaSnip", enabled = false },
    { "onsails/lspkind.nvim", enabled = false },
  },
}
