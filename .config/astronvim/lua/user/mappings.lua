return {
  n = {
    [";"] = { ":", silent = false, desc = "Quick cmd" },
    ["<enter>"] = { ":noh<enter><cr>", silent = true, desc = "No highlight" },
    j = { "v:count==0 ? 'gj' : 'j'", expr = true },
    k = { "v:count==0 ? 'gk' : 'k'", expr = true },
    ["<leader>e"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" },
    ["<leader>E"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    ["<leader>y"] = { '"*y', desc = "Yank to clipboard" },

    ["<leader>h"] = false,
  },
  v = {
    ["<leader>y"] = { '"*y', desc = "Yank to clipboard" },
  },
}
