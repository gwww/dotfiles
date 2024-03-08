-- mapleader must be set before Lazy setup is called, just because
vim.g.mapleader = ","

-- HACK: This shifty 1ms delay prevents a libuv error and nvim exiting with code 134 on `:wq`.
-- vim.api.nvim_create_autocmd({ "VimLeave" }, {
--   callback = function()
--     vim.cmd("sleep 1m")
--   end,
-- })
