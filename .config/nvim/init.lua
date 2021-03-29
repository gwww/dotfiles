-- init.lua for neovim 0.5+
-- Glenn Waters

-- Lua nvim Helpers {{{
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local execute = vim.api.nvim_command
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local map_key = vim.api.nvim_set_keymap

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
-- }}}

-- Load the Plugins {{{
local install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/savq/paq-nvim.git ' .. install_path)
end
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}       -- Plugin manager; self updating

paq {'cocopon/iceberg.vim', as='iceberg'}  -- Theme
paq {'embark-theme/vim', as='embark'}      -- Theme
paq {'joshdick/onedark.vim', as='onedark'} -- Theme

paq {'nvim-treesitter/nvim-treesitter'} -- Syntax highlighting et. al.
paq {'haya14busa/is.vim'}               -- Incremental search improvments
paq {'gwww/vim-bbye'}                   -- Delete buffer leaving window structure
paq {'tpope/vim-commentary'}            -- Toggle comments: <visual>gc, gc<motion>
paq {'tpope/vim-endwise'}               -- Auto close begin, do, ...
paq {'tpope/vim-surround'}              -- Add surround text objects e.g.: cs])
paq {'tpope/vim-repeat'}                -- Better '.' handling when repeated
paq {'vim-airline/vim-airline'}         -- Buffer/Status line
paq {'ConradIrwin/vim-bracketed-paste'} -- No more ':set paste!'
paq {'nvim-lua/popup.nvim'}             -- Required for telescope
paq {'nvim-lua/plenary.nvim'}           -- Required for telescope
paq {'nvim-telescope/telescope.nvim'}   -- Fuzzy finder on steroids
-- }}}

-- Plugin Setup {{{
vim.g['airline_powerline_fonts'] = true
vim.g['airline#extensions#whitespace#enabled'] = false
vim.g['airline#extensions#tabline#enabled'] = true
vim.g['airline_section_y'] = ''

local tree_sitter = require 'nvim-treesitter.configs'
tree_sitter.setup {ensure_installed = 'maintained', highlight = {enable = true}}
-- }}}

-- Setup Options {{{
local indent, width = 4, 80

cmd 'set formatoptions+=n'                -- Add 'n' to default formatting opts
cmd 'set whichwrap+=<,>,[,]'              -- Motions across wraped lines

opt('b', 'expandtab', true)               -- Use spaces instead of tabs
opt('b', 'tabstop', indent)               -- Number of spaces tabs count for
opt('b', 'softtabstop', indent)           --
opt('b', 'shiftwidth', indent)            -- Size of an indent
opt('w', 'wrap', true)                    -- Enable line wrap
opt('b', 'smartindent', true)             -- Insert indents automatically
opt('b', 'textwidth', width)              -- Maximum width of text
opt('o', 'hidden', true)                  -- Enable background buffers
opt('o', 'wildmode', 'list:longest')      -- Command-line completion mode
opt('o', 'ignorecase', true)              -- Ignore case
opt('o', 'scrolloff', 5 )                 -- Lines of context
opt('o', 'shiftround', true)              -- Round indent
opt('o', 'smartcase', true)               -- Don't ignore case with capitals
opt('o', 'splitbelow', true)              -- Put new windows below current
opt('o', 'splitright', true)              -- Put new windows right of current
opt('o', 'termguicolors', true)           -- True color support
opt('w', 'cursorline', true)              -- Highlight the line with cursor
opt('w', 'colorcolumn', tostring(width))  -- Line length marker
opt('w', 'list', true)                    -- Show some invisible characters
opt('w', 'number', true)                  -- Show line numbers
-- opt('w', 'relativenumber', true)          -- Relative line numbers
opt('o', 'mouse', 'a')                    -- Use mouse in all modes
opt('o', 'showmatch', true)               -- Show matching bracket
opt('o', 'matchtime', 2)                  -- Matching bracket time
opt('o', 'smarttab', true)                -- Smart tab insertion at start of line
opt('o', 'confirm', true)                 -- Confirm quit on errors
opt('o', 'linebreak', true)               -- Wrap line at natural point
opt('b', 'swapfile', false)               -- Disable swapfile
opt('o', 'showbreak', '↪')                -- Char to show on wrapped line
opt('o', 'listchars', 'tab:→ ,nbsp:␣,trail:•') -- Listchars, duh.
-- opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options
-- }}}

-- Key Mappings {{{
vim.g.mapleader = ','
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
  if api.nvim_exec('colorscheme', true) == 'onedark' then
    cmd 'highlight CursorLine   guibg=#06181f'
    cmd 'highlight CursorLineNr guifg=Gray70'
    cmd 'highlight MatchParen   guibg=DarkCyan'
    cmd 'highlight Normal       guibg=#050e1f'
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
cmd 'autocmd TextYankPost * silent! lua vim.highlight.on_yank()'

cmd 'autocmd ColorScheme * lua tweak_colours()'
cmd 'autocmd TermOpen * lua init_term()'

cmd 'colorscheme onedark'
-- }}}
