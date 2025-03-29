-- Config Docs: https://github.com/AstroNvim/astrocore#%EF%B8%8F-configuration
return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    opts.mappings.n[";"] = { ":", silent = false, desc = "Enter command mode" }
    opts.mappings.n["<Leader>y"] = { '"*y', desc = "Yank to clipboard" }
    opts.mappings.v["<Leader>y"] = { '"*y', desc = "Yank to clipboard" }
    opts.mappings.n["<Enter>"] = { "<cmd>noh<Enter><cr>", silent = true, desc = "No highlight" }
    opts.mappings.n["<A-j>"] = { ":m .+1<cr>==", desc = "Move down" }
    opts.mappings.v["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move down" }
    opts.mappings.i["<A-j>"] = { "<Esc>:m .+1<cr>==gi", desc = "Move down" }
    opts.mappings.n["<A-k>"] = { ":m .-2<cr>==", desc = "Move up" }
    opts.mappings.v["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up" }
    opts.mappings.i["<A-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "Move up" }
    opts.mappings.n["H"] = { "<cmd>Inspect<cr>" }
    opts.mappings.n["<C-Q>"] = nil
    opts.mappings.n["<Leader>dd"] = { function() Debug.show_log() end }
    opts.mappings.n["<Leader>dc"] = { function() Debug.clear_log() end }

    opts.diagnostics.underline = false
    opts.on_keys.auto_hlsearch = false
    opts.options.g.loaded_node_provider = 0
    opts.options.g.loaded_perl_provider = 0
    opts.options.g.loaded_ruby_provider = 0
    opts.options.g.loaded_python_provider = 0
    opts.options.opt.clipboard = "" -- Don't save to system clipboard; use keymap
    opts.options.opt.cmdheight = 1 -- Override cmdheight=0
    opts.options.opt.relativenumber = false -- Override
    opts.options.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
    opts.options.opt.showbreak = "↪ "
    opts.options.opt.showtabline = 0 -- Disable the tabline with the buffer list
    opts.options.opt.title = false
    opts.options.opt.whichwrap = "b,s,<,>,[,]" -- Motions that will wrap to prev/next line
    opts.options.opt.wildignorecase = true
    opts.options.opt.wildmode = "longest:full,full"
    opts.options.opt.wrap = true
  end,
}
