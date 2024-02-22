return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "c",
      "css",
      "elixir",
      "fish",
      "gitcommit",
      "gitignore",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "ruby",
      "svelte",
      "toml",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    })
  end,
}
