-- Glenn nvim config.
-- Based off of: https://github.com/numToStr/dotfiles

local o = vim.o

-- Disable shadafile
o.shadafile = 'NONE'

-- Vanilla Config
require('builtins')
require('plugins')
require('settings')
require('autocmd')
require('keybinds')

-- For debugging purpose
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

-- Enable shadafile
o.shadafile = ''
