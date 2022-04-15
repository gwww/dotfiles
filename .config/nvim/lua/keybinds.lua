local U = require("utils")

-- U.map('n', ',', '<Nop>')
vim.g.mapleader = ","
vim.g.maplocalleader = ","

U.map("n", "<tab>", ":bnext<cr>") -- Switch buffers
U.map("n", "<s-tab>", ":bprev<cr>") -- Switch buffers
U.map("n", "<leader>c", ":Bdelete<cr>") -- Close buffer
U.map("n", ";", ":", { silent = false }) -- Easier typing of ':'
U.map("n", "<enter>", ":noh<enter><cr>") -- Enter key turns off hilighted searches

U.map("", "<PageUp>", "<C-u>") -- Normal mode PageUp
U.map("", "<PageDown>", "<C-d>") -- Normal mode PageDown
U.map("i", "<PageUp>", "<C-o><C-u>") -- Input mode PageUp
U.map("i", "<PageDown>", "<C-o><C-d>") -- Input mode PageDown

U.map("n", "<leader>w", ":update<CR>") -- Save this buffer
U.map("n", "<leader>W", ":wall<CR>") -- Save all buffers

U.map("n", "<leader>1", "<C-w>o") -- Close window splits

U.map("n", "Y", "yg$")
U.map("n", "<leader>y", '"+y') -- Normal mode yank into clipboard
U.map("v", "<leader>y", '"+y') -- Visual mode yank into clipboard
U.map("n", "<leader>Y", "Y", { noremap = false })

-- Better handling of movement on word wrap
U.map("n", "j", "v:count==0 ? 'gj' : 'j'", { expr = true })
U.map("n", "k", "v:count==0 ? 'gk' : 'k'", { expr = true })
U.map("v", "j", "v:count==0 ? 'gj' : 'j'", { expr = true })
U.map("v", "k", "v:count==0 ? 'gk' : 'k'", { expr = true })

-- Shift line/block up/down
U.map("n", "<C-j>", ":move .+1<CR>")
U.map("n", "<C-k>", ":move .-2<CR>")
U.map("v", "<C-j>", ":move '>+1<CR>gv=gv")
U.map("v", "<C-k>", ":move '<-2<CR>gv=gv")

-- Reselect block after shift
U.map("v", ">", ">gv")
U.map("v", "<", "<gv")

-- From ThePrimeagen - don't understand why its useful yet
U.map("x", "<leader>p", '"_dP')
