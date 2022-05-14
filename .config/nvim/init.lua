-- Glenn nvim config.
-- Based very loosely off of: https://github.com/numToStr/dotfiles

-- For debugging purpose
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

-- Compiled cache of plugins
pcall(require, "impatient")

require("builtins")
require("keybinds") -- Call early to set leader
require("settings")
require("plugins")
require("autocmd")

-- local fd = vim.loop.fs_scandir(vim.fn.stdpath('config') .. '/lua/plugins/')
-- for name in function() return vim.loop.fs_scandir_next(fd) end do
--     print('plugins.' .. name:gsub('.lua\z', ''))
-- end
