local api = vim.api

local gwww_augroup = api.nvim_create_augroup("gwww", { clear = false })

api.nvim_create_autocmd("BufWinEnter", {
    group = gwww_augroup,
    callback = function() vim.opt.formatoptions = vim.opt.formatoptions - "o" end,
})

api.nvim_create_autocmd("TermOpen", {
    group = gwww_augroup,
    callback = function()
        vim.wo.number = false
        vim.wo.spell = false
        vim.wo.signcolumn = "auto"
        vim.cmd("startinsert")
    end,
})

api.nvim_create_autocmd("TextYankPost", {
    group = gwww_augroup,
    callback = function() vim.highlight.on_yank({ timeout = 400 }) end,
})

api.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "crontab",
    callback = function()
        vim.bo.backup = false
        vim.bo.writebackup = false
    end,
})

api.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "lua",
    callback = function() vim.bo.shiftwidth = 4 end,
})

api.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "yaml",
    callback = function() vim.wo.foldmethod = "indent" end,
})

-- toggle_wrap = function()
--   if string.find(vim.o.formatoptions, "a") then
--     print("Wrapping OFF")
--     cmd "set formatoptions-=a"
--   else
--     print("Wrapping ON")
--     cmd "set formatoptions+=a"
--   end
--   -- opt("w", "breakindent", not vim.wo.breakindent)
-- end
