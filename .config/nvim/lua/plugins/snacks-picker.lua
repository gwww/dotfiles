return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = { picker = { ui_select = true } },
  specs = {
    {
      "AstroNvim/astroui",
      opts = { highlights = { init = { SnacksPickerDir = { fg = "#626875" } } } },
    },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local p = require("snacks").picker
        maps.n["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
        if vim.fn.executable "git" == 1 then
          maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
          maps.n["<Leader>gb"] = { function() p.git_branches() end, desc = "Git branches" }
          maps.n["<Leader>gc"] = { function() p.git_log() end, desc = "Git commits (repository)" }
          maps.n["<Leader>gC"] =
            { function() p.git_log { current_file = true, follow = true } end, desc = "Git commits (current file)" }
          maps.n["<Leader>gt"] = { function() p.git_status() end, desc = "Git status" }
        end
        maps.n["<Leader>f<CR>"] = { function() p.resume() end, desc = "Resume previous search" }
        maps.n["<Leader>f'"] = { function() p.marks() end, desc = "Find marks" }
        maps.n["<Leader>fl"] = { function() p.lines() end, desc = "Find lines" }
        maps.n["<Leader>fa"] = {
          function() p.files { cwd = vim.fn.stdpath "config", desc = "Config Files" } end,
          desc = "Find AstroNvim config files",
        }
        maps.n["<Leader>fb"] = { function() p.buffers() end, desc = "Find buffers" }
        maps.n["<Leader>fc"] = { function() p.grep_word() end, desc = "Find word under cursor" }
        maps.n["<Leader>fC"] = { function() p.commands() end, desc = "Find commands" }
        maps.n["<Leader>ff"] = {
          function() p.files { hidden = vim.tbl_get(vim.uv.fs_stat ".git" or {}, "type") == "directory" } end,
          desc = "Find files",
        }
        maps.n["<Leader>fF"] = { function() p.files { hidden = true, ignored = true } end, desc = "Find all files" }
        maps.n["<Leader>fg"] = { function() p.git_files() end, desc = "Find git files" }
        maps.n["<Leader>fh"] = { function() p.help() end, desc = "Find help" }
        maps.n["<Leader>fk"] = { function() p.keymaps() end, desc = "Find keymaps" }
        maps.n["<Leader>fm"] = { function() p.man() end, desc = "Find man" }
        maps.n["<Leader>fo"] = { function() p.recent() end, desc = "Find old files" }
        maps.n["<Leader>fO"] = { function() p.recent { cwd = true } end, desc = "Find old files (cwd)" }
        maps.n["<Leader>fr"] = { function() p.registers() end, desc = "Find registers" }
        maps.n["<Leader>fs"] = {
          function() p.smart { multi = { { source = "buffers", current = false }, "files" } } end,
          desc = "Find buffers/files",
        }
        maps.n["<Leader>ft"] = { function() p.colorschemes() end, desc = "Find themes" }
        maps.n["<Leader>fu"] = { function() p.undo() end, desc = "Undo list" }
        if vim.fn.executable "rg" == 1 then
          maps.n["<Leader>fw"] = { function() p.grep() end, desc = "Find words" }
          maps.n["<Leader>fW"] =
            { function() p.grep { hidden = true, ignored = true } end, desc = "Find words in all files" }
        end
        maps.n["<Leader>lD"] = { function() p.diagnostics() end, desc = "Search diagnostics" }
        maps.n["<Leader>ls"] = { function() p.lsp_symbols() end, desc = "Search symbols" }

        maps.n["<Leader>e"] = maps.n["<Leader>ff"]
        maps.n["<space>"] = {
          function()
            if #vim.t.bufs > 1 then
              p.buffers {
                current = false,
                win = { input = { keys = { ["<Space>"] = { "confirm", mode = { "n", "i" } } } } },
              }
            end
          end,
          desc = "Find buffers",
        }
      end,
    },
    {
      "folke/todo-comments.nvim",
      optional = true,
      dependencies = { "folke/snacks.nvim" },
      specs = {
        {
          "AstroNvim/astrocore",
          opts = {
            mappings = {
              n = {
                ["<Leader>fT"] = {
                  function()
                    if not package.loaded["todo-comments"] then -- make sure to load todo-comments
                      require("lazy").load { plugins = { "todo-comments.nvim" } }
                    end
                    p.todo_comments()
                  end,
                  desc = "Todo Comments",
                },
              },
            },
          },
        },
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        commands = {
          find_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            p.files { cwd = path }
          end,
        },
        window = { mappings = { F = "find_in_dir" } },
      },
    },
    { "nvim-telescope/telescope.nvim", enabled = false },
    { "stevearc/dressing.nvim", opts = { select = { enabled = false } } },
  },
}
