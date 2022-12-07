vim.keymap.set('n', '<space>', '<c-]>', { buffer = true })
vim.keymap.set('n', '<bs>', '<c-t>', { buffer = true })
vim.keymap.set('n', 'q', '<cmd>bdelete<cr>', { buffer = true })
vim.keymap.set('n', 's', [[/|\S\+|<cr>]], { buffer = true })
