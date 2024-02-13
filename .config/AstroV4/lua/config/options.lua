vim.opt.wildmode = "longest:full,full"
vim.opt.wildignorecase = true

vim.opt.clipboard = "" -- Don't save to system clipboard; use keymap
vim.opt.confirm = true -- Confirm quit on errors
vim.opt.cmdheight = 1 -- Override cmdheight=0
vim.opt.linebreak = true -- Break at "natural" spot on wrap
vim.opt.relativenumber = false -- Override
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.showtabline = 0 -- Disable the tabline with the buffer list
vim.opt.timeoutlen = 300
vim.opt.title = false
vim.opt.wrap = true -- Wrap lines
vim.opt.whichwrap = "b,s,<,>,[,]" -- Motions that will wrap to prev/next line

vim.g.mapleader = ","
