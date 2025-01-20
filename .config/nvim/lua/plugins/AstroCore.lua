-- Config Docs: https://github.com/AstroNvim/astrocore#%EF%B8%8F-configuration
return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    opts.diagnostics.underline = false
    opts.on_keys.auto_hlsearch = false

    local maps = opts.mappings
    maps.n[";"] = { ":", silent = false, desc = "Enter command mode" }
    maps.n["H"] = { "<cmd>Inspect<cr>" }
    maps.n["<Leader>y"] = { '"*y', desc = "Yank to clipboard" }
    maps.v["<Leader>y"] = { '"*y', desc = "Yank to clipboard" }
    maps.n["<enter>"] = { "<cmd>noh<Enter><cr>", silent = true, desc = "No highlight" }
    maps.n["<Leader>w"] =
      { function() require("smart-splits").start_resize_mode() end, desc = "Enter window resize mode" }
    maps.n["<A-j>"] = { ":m .+1<cr>==", desc = "Move down" }
    maps.v["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move down" }
    maps.i["<A-j>"] = { "<Esc>:m .+1<cr>==gi", desc = "Move down" }
    maps.n["<A-k>"] = { ":m .-2<cr>==", desc = "Move up" }
    maps.v["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up" }
    maps.i["<A-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "Move up" }

    local o = opts.options
    o.g.loaded_node_provider = 0
    o.g.loaded_perl_provider = 0
    o.g.loaded_ruby_provider = 0
    o.g.loaded_python_provider = 0
    o.opt.clipboard = "" -- Don't save to system clipboard; use keymap
    o.opt.cmdheight = 1 -- Override cmdheight=0
    o.opt.relativenumber = false -- Override
    o.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
    o.opt.showbreak = "↪ "
    o.opt.showtabline = 0 -- Disable the tabline with the buffer list
    o.opt.title = false
    o.opt.whichwrap = "b,s,<,>,[,]" -- Motions that will wrap to prev/next line
    o.opt.wildignorecase = true
    o.opt.wildmode = "longest:full,full"
    o.opt.wrap = true
  end,
}
