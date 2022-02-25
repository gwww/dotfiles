-- Glenn nvim config.
-- Based off of: https://github.com/numToStr/dotfiles

require('builtins')
require('plugins')
require('settings')
require('autocmd')
require('keybinds')

vim.cmd 'colorscheme jellybeans-compiled'

-- For debugging purpose
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
