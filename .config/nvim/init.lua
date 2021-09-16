-- init.lua for neovim 0.5+
-- Glenn Waters

-- Lua nvim Helpers {{{
local cmd, fn, g = vim.cmd, vim.fn, vim.g
local execute = vim.api.nvim_command
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local map_key = vim.api.nvim_set_keymap

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
-- }}}

vim.g['loaded_python_provider'] = 0
vim.g['loaded_python3_provider'] = 0

-- Load the Plugins {{{
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  cmd 'packadd packer.nvim'
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'  -- Syntax highlighting et. al.
  use 'haya14busa/is.vim'                -- Incremental search improvments
  use 'gwww/vim-bbye'                    -- Delete buffer leaving window structure
  use 'tpope/vim-commentary'             -- Toggle comments: <visual>gc, gc<motion>
  use 'tpope/vim-endwise'                -- Auto close begin, do, ...
  use 'tpope/vim-surround'               -- Add surround text objects e.g.: cs])
  use 'tpope/vim-repeat'                 -- Better '.' handling when repeated
  use 'vim-airline/vim-airline'          -- Buffer/Status line
  use 'ConradIrwin/vim-bracketed-paste'  -- No more ':set paste!'
  use 'wellle/targets.vim'
  use 'windwp/nvim-autopairs'
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
end)

  -- use 'joshdick/onedark.vim'             -- Theme
  -- use {'embark-theme/vim', as='embark'}  -- Theme
  -- use 'hoob3rt/lualine.nvim'
  -- use 'jose-elias-alvarez/buftabline.nvim'
  -- use 'rafcamlet/nvim-luapad'
-- }}}

-- Plugin Setup {{{
vim.g['airline_powerline_fonts'] = true
vim.g['airline#extensions#whitespace#enabled'] = false
vim.g['airline#extensions#tabline#enabled'] = true
vim.g['airline_section_y'] = ''

-- require('lualine').setup {
--   options = {theme = 'onedark'},
-- }
-- require("buftabline").setup {}
require('nvim-autopairs').setup{}

local tree_sitter = require 'nvim-treesitter.configs'
tree_sitter.setup {ensure_installed = 'maintained', highlight = {enable = true}}
-- }}}

-- Setup Options {{{
local indent, width = 4, 80

cmd 'set formatoptions+=n'
cmd 'set formatoptions-=o'
-- stolen from tjdevries
-- vim.opt.formatoptions = vim.opt.formatoptions
--   - "a" -- Auto formatting is BAD.
--   - "t" -- Don't auto format my code. I got linters for that.
--   + "c" -- In general, I like it when comments respect textwidth
--   + "q" -- Allow formatting comments w/ gq
--   + "r" -- But do continue when pressing enter.
--   + "j" -- Auto-remove comments if possible.
--   - "2" -- I'm not in gradeschool anymore

cmd 'set whichwrap+=<,>,[,]'              -- Motions across wraped lines

opt('o', 'confirm', true)                 -- Confirm quit on errors
opt('o', 'hidden', true)                  -- Switch buffers without saving
opt('o', 'ignorecase', true)              -- Ignore case
opt('o', 'linebreak', true)               -- Wrap line at natural point
opt('o', 'listchars', 'tab:→ ,nbsp:␣,trail:•') -- Listchars, duh.
opt('o', 'matchtime', 2)                  -- Matching bracket time
opt('o', 'mouse', 'a')                    -- Use mouse in all modes
opt('o', 'scrolloff', 5 )                 -- Lines of context
opt('o', 'shiftround', true)              -- Round indent
opt('o', 'showbreak', '↪')                -- Char to show on wrapped line
opt('o', 'showmatch', true)               -- Show matching bracket
opt('o', 'smartcase', true)               -- Don't ignore case with capitals
opt('o', 'smarttab', true)                -- Smart tab insertion at start of line
opt('o', 'splitbelow', true)              -- Put new windows below current
opt('o', 'splitright', true)              -- Put new windows right of current
opt('b', 'swapfile', false)               -- Disable swapfile
opt('o', 'termguicolors', true)           -- True color support
opt('o', 'wildmenu', true)                -- Show menu on cmd line completion
opt('o', 'wildmode', 'longest:full','full') -- Command-line completion mode
-- opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options

opt('b', 'expandtab', true)               -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)            -- Size of an indent
opt('b', 'smartindent', true)             -- Insert indents automatically
opt('b', 'softtabstop', indent)           --
opt('b', 'tabstop', indent)               -- Number of spaces tabs count for
-- opt('b', 'textwidth', width)              -- Maximum width of text
opt('w', 'wrap', true)                    -- Enable line wrap

opt('w', 'cursorline', true)              -- Highlight the line with cursor
opt('w', 'list', true)                    -- Show some invisible characters
opt('w', 'number', true)                  -- Show line numbers
-- }}}

-- Key Mappings {{{
vim.g.mapleader = ','
vim.g.maplocalleader = ","
map_key('n', ';', ':', {noremap=true})       -- Easier typing of ':'
map_key('n', 'j', 'gj', {noremap=true})      -- Down display line
map_key('n', 'k', 'gk', {noremap=true})      -- Up display line
map_key('v', 'j', 'gj', {noremap=true})      -- Down display line
map_key('v', 'k', 'gk', {noremap=true})      -- Up display line
map_key('', '<PageUp>', '<C-u>', {})         -- Normal mode PageUp
map_key('', '<PageDown>', '<C-d>', {})       -- Normal mode PageDown
map_key('i', '<PageUp>', '<C-o><C-u>', {})   -- Input mode PageUp
map_key('i', '<PageDown>', '<C-o><C-d>', {}) -- Input mode PageDown
map_key('', '<C-j>', '<C-w>j', {})           -- Move down a window
map_key('', '<C-k>', '<C-w>k', {})           -- Move up a window
map_key('', '<C-h>', '<C-w>h', {})           -- Move left a window
map_key('', '<C-l>', '<C-w>l', {})           -- Move right a window
map_key('', '<leader>1', '<C-w>o', {})       -- Delete all windows but current
map_key('', '<leader>2', '<C-w>s', {})       -- Split horizontal
map_key('', '<leader>3', '<C-w>v', {})       -- Split vertical
map_key('v', '>', '>gv', {noremap=true})     -- Reselect block after indent
map_key('v', '<', '<gv', {noremap=true})     -- Reselect block after outdent
map_key('v', 'J', ":m '>+1<CR>gv=gv", {noremap=true}) -- Move visual block
map_key('v', 'K', ":m '<-2<CR>gv=gv", {noremap=true}) -- Move visual block
map_key('n', '<tab>', ':bnext<cr>', {noremap=true})   -- Switch buffers
map_key('n', '<s-tab>', ':bprev<cr>', {noremap=true}) -- Switch buffers
map_key('', 'Y', 'y$', {})                            -- Yank from cursor to EOL
map_key('', '<leader>y', '"+y', {noremap=true})       -- Yank to system copy/paste

-- Binding for Plugins & Lua Functions
map_key('', '<leader>c', ':Bdelete<cr>', {silent=true})
map_key('', '<leader>e', ':Telescope find_files<cr>', {silent=true})
map_key('', '<leader>E', ':Telescope find_files <dir><cr>', {silent=true})
map_key('n', '<leader>/', ':Telescope live_grep', {noremap=true})
map_key('n', '<leader>w', '<cmd>lua toggle_wrap()<CR>', {silent=true})
-- }}}

-- Lua Support Functions {{{
init_term = function()
  cmd 'setlocal nonumber norelativenumber'
  cmd 'setlocal nospell'
  cmd 'setlocal signcolumn=auto'
end

tweak_colours = function()
  if vim.api.nvim_exec('colorscheme', true) == 'onedark' then
    cmd 'highlight CursorLine   guibg=#06181f'
    cmd 'highlight CursorLineNr guifg=Gray70'
    cmd 'highlight MatchParen   guibg=DarkCyan'
    cmd 'highlight Normal       guibg=#050e1f'
    -- cmd 'highlight IncSearch    guibg=DarkCyan'
  end
end

toggle_wrap = function()
  if string.find(vim.o.formatoptions, 'a') then
    print('Wrapping OFF')
    cmd 'set formatoptions-=a'
  else
    print('Wrapping ON')
    cmd 'set formatoptions+=a'
  end
  -- opt('w', 'breakindent', not vim.wo.breakindent)
end
-- }}}

-- Misc (Auto Commands, Color Scheme, ...) {{{
cmd 'autocmd FileType crontab setlocal nobackup nowritebackup'
cmd 'autocmd FileType yaml setlocal foldmethod=indent'
cmd 'autocmd FileType c setlocal shiftwidth=4'
cmd 'autocmd TextYankPost * silent! lua vim.highlight.on_yank({timeout=400})'

cmd 'autocmd ColorScheme * lua tweak_colours()'
cmd 'autocmd TermOpen * lua init_term()'

cmd 'colorscheme testcolors'
-- }}}
