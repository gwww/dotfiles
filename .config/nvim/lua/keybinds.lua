local U = require('utils')

U.map('n', ',', '<Nop>') -- Curious??
vim.g.mapleader = ','
vim.g.maplocalleader = ','

U.map('n', '<tab>', ':bnext<cr>')       -- Switch buffers
U.map('n', '<s-tab>', ':bprev<cr>')     -- Switch buffers
U.map('n', '<leader>c', ':Bdelete<cr>') -- Close buffer
U.map('n', ';', ':', {silent=false})    -- Easier typing of ':'
U.map('', '<PageUp>', '<C-u>')          -- Normal mode PageUp
U.map('', '<PageDown>', '<C-d>')        -- Normal mode PageDown
U.map('i', '<PageUp>', '<C-o><C-u>')    -- Input mode PageUp
U.map('i', '<PageDown>', '<C-o><C-d>')  -- Input mode PageDown
U.map('n', '<leader>w', ':update<CR>')  -- Save this buffer
U.map('n', '<leader>W', ':wall<CR>')    -- Save all buffers

-- Better handling of movement on word wrap
U.map('n', 'j', "v:count==0 ? 'gj' : 'j'", {expr = true})
U.map('n', 'k', "v:count==0 ? 'gk' : 'k'", {expr = true})
U.map('v', 'j', "v:count==0 ? 'gj' : 'j'", {expr = true})
U.map('v', 'k', "v:count==0 ? 'gk' : 'k'", {expr = true})

-- Shift line/block up/down
U.map('n', '<C-j>', ':move .+1<CR>')
U.map('n', '<C-k>', ':move .-2<CR>')
U.map('v', '<C-j>', ":move '>+1<CR>gv=gv")
U.map('v', '<C-k>', ":move '<-2<CR>gv=gv")

-- Reselect block after shift
U.map('v', '>', '>gv')
U.map('v', '<', '<gv')

-- Fix * (Keep the cursor position, don't move to next match)
-- U.map('n', '*', '*N')

-- Visual * and # search
-- Until https://github.com/neovim/neovim/pull/15472 is merged
-- U.map('x', '*', 'y/\\V<C-R>"<CR>')
-- U.map('x', '#', 'y?\\V<C-R>"<CR>')

-- Fix n and N. Keeping cursor in center
-- U.map('n', 'n', 'nzz')
-- U.map('n', 'N', 'Nzz')

-- Mimic shell movements
-- U.map('i', '<C-E>', '<ESC>A')
-- U.map('i', '<C-A>', '<ESC>I')

-- Fast execute macro
-- U.map('x', '<S-q>', ':normal @@<CR>')
-- U.map('n', '<S-q>', ':normal @@<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
