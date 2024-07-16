return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "RRethy/nvim-treesitter-endwise" },
  opts = function(_, opts)
    opts.endwise = { enable = true }
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "css",
      "elixir",
      "fish",
      "gitcommit",
      "gitignore",
      "html",
      "javascript",
      "json",
      "ruby",
      "svelte",
      "typescript",
      "yaml",
    })
  end,
}
