return {
  "saghen/blink.cmp",
  version = "^1",

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    cmdline = {
      completion = {
        menu = { auto_show = function(ctx) return ctx.mode == "cmdline" and #ctx.line > 2 end },
        list = { selection = { preselect = false } },
      },
      keymap = { ["<Right>"] = { nil }, ["<Left>"] = { nil } },
    },
    completion = { documentation = { auto_show = false } },
    fuzzy = { sorts = { "exact", "score", "sort_text" } },
  },
}
