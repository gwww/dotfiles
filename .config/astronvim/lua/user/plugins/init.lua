return {
  -- Disabled plugins:
  ["goolord/alpha-nvim"] = { disable = true },
  ["onsails/lspkind.nvim"] = { disable = true },
  ["akinsho/bufferline.nvim"] = { disable = true }, -- TODO remove in v3
  ["lukas-reineke/indent-blankline.nvim"] = { disable = true },

  -- Added plugins:
  ["nvim-treesitter/playground"] = {
    cmd = "TSHighlightCapturesUnderCursor",
  },

  ["folke/neodev.nvim"] = {},

  ["EdenEast/nightfox.nvim"] = {
    run = ":NightfoxCompile",
    config = function() require "user.plugins.nightfox" end,
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    config = function() require "user.plugins.neo-tree" end,
  }
}
