local gwww_augroup = vim.api.nvim_create_augroup("gwww", { clear = false })

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = gwww_augroup,
    callback = function() vim.opt.formatoptions = vim.opt.formatoptions - "o" end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = gwww_augroup,
    callback = function() vim.highlight.on_yank({ timeout = 400 }) end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "lua",
    callback = function() vim.bo.shiftwidth = 4 end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "yaml",
    callback = function() vim.wo.foldmethod = "indent" end,
})
