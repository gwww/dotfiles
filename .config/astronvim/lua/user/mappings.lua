local map = { n = {}, i = {}, v = {} }
local input = map.i
local normal = map.n
local visual = map.v

normal[';'] = { ":", silent = false, desc = "Quick cmd" }
normal["<enter>"] = { ":noh<enter><cr>", silent = true, desc = "No highlight" }

normal['j'] = { "v:count==0 ? 'gj' : 'j'", expr = true }
normal['k'] = { "v:count==0 ? 'gk' : 'k'", expr = true }

normal["<leader>e"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" }
normal["<leader><leader>"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" }
normal["<leader>E"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" }

normal['L'] = { "<cmd>bnext<cr>", desc = "Next buffer" }
normal['H'] = { "<cmd>bprev<cr>", desc = "Prev buffer" }

normal["<leader>y"] = { '"*y', desc = "Yank to clipboard" }
visual["<leader>y"] = { '"*y', desc = "Yank to clipboard" }

normal["<A-j>"] = { ":m .+1<cr>==", desc = "Move down" }
visual["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move down" }
input["<A-j>"] = { "<Esc>:m .+1<cr>==gi", desc = "Move down" }
normal["<A-k>"] = { ":m .-2<cr>==", desc = "Move up" }
visual["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up" }
input["<A-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "Move up" }

return map
