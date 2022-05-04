local o = vim.opt

o.termguicolors = true
o.scrolloff = 4
o.number = true
o.signcolumn = "yes"
o.foldenable = false
o.cursorline = true

o.expandtab = true
o.smarttab = true
o.tabstop = 8
o.softtabstop = 4
o.shiftwidth = 4
o.shiftround = true -- Round indent

o.wrap = true
o.ignorecase = true
o.smartcase = true
o.swapfile = false
o.completeopt = "menuone,noinsert,noselect"
o.confirm = true -- Confirm quit on errors
o.linebreak = true -- Wrap line at natural point
o.mouse = "a" -- Use mouse in all modes
o.showmode = false -- Don't show input, etc. mode
o.formatoptions = o.formatoptions + "cjnqr" - "aot2"
o.list = true -- Show some invisible characters
o.whichwrap:append("<,>,[,]")
o.listchars = "tab:→ ,nbsp:␣,trail:•"
o.wildmode = { "longest:full", "full" } -- Command-line completion mode
o.wildignorecase = true

-- o.clipboard = 'unnamedplus'
-- o.smartindent = true             -- Insert indents automatically

_G.P = function(v)
    print(vim.inspect(v))
    return v
end
