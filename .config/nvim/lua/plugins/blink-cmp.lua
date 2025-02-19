return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  opts_extend = { "sources.default" },

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
    completion = {
      trigger = { show_in_snippet = false },
      menu = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
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
    fuzzy = { sorts = { "exact", "score", "sort_text" } },
    cmdline = { sources = {} },
  },
  specs = {
    -- disable built in completion plugins
    { "hrsh7th/nvim-cmp", enabled = false },
    { "rcarriga/cmp-dap", enabled = false },
    { "L3MON4D3/LuaSnip", enabled = false },
    { "onsails/lspkind.nvim", enabled = false },
  },
}
