local map = require("utils").map

map({ "n", "v" }, ",", "<Nop>")
vim.g.mapleader = ","
vim.g.maplocalleader = ","

map("n", "<tab>", ":bnext<cr>") -- Switch buffers
map("n", "<s-tab>", ":bprev<cr>") -- Switch buffers
map("n", "<leader>c", ":Bdelete<cr>") -- Close buffer
map("n", ";", ":", { silent = false }) -- Easier typing of ':'
map("n", "<enter>", ":noh<enter><cr>") -- Enter key turns off hilighted searches

map("", "<PageUp>", "<C-u>") -- Normal mode PageUp
map("", "<PageDown>", "<C-d>") -- Normal mode PageDown
map("i", "<PageUp>", "<C-o><C-u>") -- Input mode PageUp
map("i", "<PageDown>", "<C-o><C-d>") -- Input mode PageDown

map("n", "<leader>w", ":update<CR>") -- Save this buffer
map("n", "<leader>W", ":wall<CR>") -- Save all buffers

map("n", "<leader>E", ":NvimTreeToggle<CR>")

map("n", "<leader>1", "<C-w>o") -- Close window splits

map("n", "Y", "yg$")
map("n", "<leader>y", '"*y') -- Normal mode yank into clipboard
map("v", "<leader>y", '"*y') -- Visual mode yank into clipboard
map("n", "<leader>Y", '"+Y', { remap = true })

-- Better handling of movement on word wrap
map("n", "j", "v:count==0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count==0 ? 'gk' : 'k'", { expr = true })
map("v", "j", "v:count==0 ? 'gj' : 'j'", { expr = true })
map("v", "k", "v:count==0 ? 'gk' : 'k'", { expr = true })

-- Shift line/block up/down
map("n", "<C-j>", ":move .+1<CR>")
map("n", "<C-k>", ":move .-2<CR>")
map("v", "<C-j>", ":move '>+1<CR>gv=gv")
map("v", "<C-k>", ":move '<-2<CR>gv=gv")

-- Reselect block after shift
map("v", ">", ">gv")
map("v", "<", "<gv")

-- From ThePrimeagen - don't understand why its useful yet
map("x", "<leader>p", '"_dP')

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.setloclist)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<M-k>", vim.lsp.buf.signature_help)
