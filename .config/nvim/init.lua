-- Glenn nvim config.
-- Based very loosely off of: https://github.com/numToStr/dotfiles

pcall(require, "impatient")
-- require('utils').setup_nvim_set_keymap_shim()

require('builtins')
require('keybinds') -- Call early to set leader
require('settings')
require('plugins')
require('autocmd')

-- For debugging purpose
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
