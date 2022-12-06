return {
  -- Disabled plugins:
  ["goolord/alpha-nvim"] = { disable = true },
  ["onsails/lspkind.nvim"] = { disable = true },

  -- Added plugins:
  ["nvim-treesitter/playground"] = {
    cmd = "TSHighlightCapturesUnderCursor",
  },

  ["EdenEast/nightfox.nvim"] = {
    run = ":NightfoxCompile",
    config = function() require "user.plugins.nightfox" end,
  },
}
