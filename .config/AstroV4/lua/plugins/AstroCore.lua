-- Define key mappings as separate table, just so I can organize it better
local keymap = { n = {}, i = {}, v = {} }
local input, normal, visual = keymap.i, keymap.n, keymap.v

normal[";"] = { ":", silent = false, desc = "Quick cmd" }
normal["<Leader>e"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" }
-- normal["<space>"] = { "<cmd>Telescope buffers<cr>", desc = "Find buffers" }
normal["<space>"] = {
  function()
    if #vim.t.bufs > 1 then vim.api.nvim_command "Telescope buffers" end
  end,
  desc = "Find buffers",
}
normal["L"] = {
  function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
  desc = "Next buffer",
}
normal["H"] = {
  function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Previous buffer",
}
normal["<Leader>y"] = { '"*y', desc = "Yank to clipboard" }
visual["<Leader>y"] = { '"*y', desc = "Yank to clipboard" }

normal["<enter>"] = { "<cmd>noh<Enter><cr>", silent = true, desc = "No highlight" }
normal["<esc>"] = { "<cmd>noh<cr>", silent = true, desc = "No highlight" }

normal["<A-j>"] = { ":m .+1<cr>==", desc = "Move down" }
visual["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move down" }
input["<A-j>"] = { "<Esc>:m .+1<cr>==gi", desc = "Move down" }
normal["<A-k>"] = { ":m .-2<cr>==", desc = "Move up" }
visual["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up" }
input["<A-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "Move up" }

-- Config Docs: https://github.com/AstroNvim/astrocore#%EF%B8%8F-configuration
return {
  "AstroNvim/astrocore",
  opts = {
    autocmds = {
      gwww = { -- Autocmd group
        {
          event = { "FileType" },
          desc = "Remove formatoption 'o'",
          callback = function() vim.opt.formatoptions = vim.opt.formatoptions - "o" end,
        },
      },
    },
    mappings = keymap,
    on_keys = { auto_hlsearch = false },
    options = {
      opt = {
        wildmode = "longest:full,full",
        wildignorecase = true,
        clipboard = "", -- Don't save to system clipboard; use keymap
        confirm = true, -- Confirm quit on errors
        cmdheight = 1, -- Override cmdheight=0
        linebreak = true, -- Break at "natural" spot on wrap
        relativenumber = false, -- Override
        sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
        showtabline = 0, -- Disable the tabline with the buffer list
        timeoutlen = 300,
        title = false,
        wrap = true, -- Wrap lines
        whichwrap = "b,s,<,>,[,]", -- Motions that will wrap to prev/next line

        showbreak = "↪ ",
      },
    },
  },
}
