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
