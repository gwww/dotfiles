local au2 = require("au2")
local cmd = vim.cmd

au2.group("MyFileTypes", {
    {"FileType", "crontab", "setlocal nobackup nowritebackup"},
    {"FileType", "lua",     "setlocal shiftwidth=4"},
    {"FileType", "yaml",    "setlocal foldmethod=indent"},
})

au2.TextYankPost = function()
    vim.highlight.on_yank({timeout=400})
end

-- Open help vertically and press q to exit
au2.BufEnter = {
    "*.txt",
    function()
        if vim.bo.buftype == "help" then
            cmd("wincmd L")
            local nr = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_set_keymap(nr, "n", "q", ":q<CR>", {noremap=true, silent=true})
        end
    end,
}

au2.TermOpen = function()
    cmd "setlocal nonumber norelativenumber"
    cmd "setlocal nospell"
    cmd "setlocal signcolumn=auto"
    cmd "startinsert"
end

au2.BufWinEnter = function()
    cmd "set formatoptions-=o"
end

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
