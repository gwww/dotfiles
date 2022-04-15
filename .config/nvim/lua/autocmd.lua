local A = vim.api

local gwww_augroup = A.nvim_create_augroup("gwww", { clear = false })

A.nvim_create_autocmd("BufWinEnter", {
    group = gwww_augroup,
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - "o"
    end,
})

A.nvim_create_autocmd("TermOpen", {
    group = gwww_augroup,
    callback = function()
        vim.wo.number = false
        vim.wo.spell = false
        vim.wo.signcolumn = "auto"
        vim.cmd("startinsert")
    end,
})

A.nvim_create_autocmd("TextYankPost", {
    group = gwww_augroup,
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 400 })
    end,
})

A.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "crontab",
    callback = function()
        vim.bo.backup = false
        vim.bo.writebackup = false
    end,
})

A.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "lua",
    callback = function()
        vim.bo.shiftwidth = 4
    end,
})

A.nvim_create_autocmd("FileType", {
    group = gwww_augroup,
    pattern = "yaml",
    callback = function()
        vim.wo.foldmethod = "indent"
    end,
})

-- au2.group("MyFileTypes", {
--     { "FileType", "crontab", "setlocal nobackup nowritebackup" },
--     { "FileType", "lua", "setlocal shiftwidth=4" },
--     { "FileType", "yaml", "setlocal foldmethod=indent" },
-- })
--
-- au2.TextYankPost = function()
--     vim.highlight.on_yank({ timeout = 400 })
-- end

-- Open help vertically and press q to exit
-- au2.BufEnter = {
--     "*.txt",
--     function()
--         if vim.bo.buftype == "help" then
--             cmd("wincmd L")
--             local nr = vim.api.nvim_get_current_buf()
--             vim.api.nvim_buf_set_keymap(nr, "n", "q", ":q<CR>", { noremap = true, silent = true })
--         end
--     end,
-- }

-- au2.TermOpen = function()
--     cmd("setlocal nonumber norelativenumber")
--     cmd("setlocal nospell")
--     cmd("setlocal signcolumn=auto")
--     cmd("startinsert")
-- end

-- au2.BufWinEnter = function()
--     cmd("set formatoptions-=o")
-- end

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
