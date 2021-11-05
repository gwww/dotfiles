local U = require('utils')

local cmd, g, o = vim.cmd, vim.g, vim.opt

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

cmd 'colorscheme jellybeans-compiled'

o.termguicolors = true
o.hidden = true -- This is 0.6 default
o.scrolloff = 8
o.scrolloff = 4
o.number = true
o.signcolumn = 'yes'
o.cursorline = true
o.expandtab = true
o.smarttab = true
o.wrap = true
o.tabstop = 8
o.shiftwidth = 4
o.softtabstop = 4
o.clipboard = 'unnamedplus'
o.ignorecase = true
o.smartcase = true
o.swapfile = false
o.completeopt = 'menuone,noinsert,noselect'
o.confirm = true                 -- Confirm quit on errors
o.linebreak = true               -- Wrap line at natural point
o.mouse = "a"                    -- Use mouse in all modes
-- o.smartindent = true             -- Insert indents automatically
o.showmode = false               -- Don't show input, etc. mode
o.shiftround = true              -- Round indent
o.formatoptions = o.formatoptions + "cjnqr" - "aot2"
o.list = true                    -- Show some invisible characters
o.whichwrap:append("<,>,[,]")
o.listchars = 'tab:→ ,nbsp:␣,trail:•'
o.wildmode = {"longest:full", "full"} -- Command-line completion mode

_G.P = function(v)
  print(vim.inspect(v))
  return v
end