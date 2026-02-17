return {
  "AstroNvim/astrocore",
  dependencies = { "RRethy/nvim-treesitter-endwise" },
  opts = {
    treesitter = {
      ensure_installed = {
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
      },
      highlight = true,
    },
  },
}
