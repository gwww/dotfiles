local map = { n = {}, i = {}, v = {} }
local input, normal, visual = map.i, map.n, map.v

normal[';'] = { ":", silent = false, desc = "Quick cmd" }
normal["<enter>"] = { "<cmd>noh<enter><cr>", silent = true, desc = "No highlight" }
normal["<esc>"] = { "<cmd>noh<cr>", silent = true, desc = "No highlight" }

normal["<leader>e"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" }
normal["<space>"] = { "<cmd>Telescope buffers<cr>", desc = "Find buffers" }

normal['L'] = {
    function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Next buffer"
}
normal['H'] = {
    function() require("astronvim.utils.buffer").nav( -(vim.v.count > 0 and vim.v.count or 1)) end,
    desc = "Previous buffer"
}

normal["<leader>y"] = { '"*y', desc = "Yank to clipboard" }
visual["<leader>y"] = { '"*y', desc = "Yank to clipboard" }

normal["<A-j>"] = { ":m .+1<cr>==", desc = "Move down" }
visual["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move down" }
input["<A-j>"] = { "<Esc>:m .+1<cr>==gi", desc = "Move down" }
normal["<A-k>"] = { ":m .-2<cr>==", desc = "Move up" }
visual["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up" }
input["<A-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "Move up" }

return map
