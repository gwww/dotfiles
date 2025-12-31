return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },
    indent = { enabled = false },
    words = { enabled = false },
    picker = { ui_select = true },
  },
  specs = {
    {
      "AstroNvim/astroui",
      opts = { highlights = { init = { SnacksPickerDir = { fg = "#626875" } } } },
    },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>e"] = maps.n["<Leader>ff"]
        maps.n["<Leader>E"] = {
          function()
            local explorer = require("snacks").picker.get({ source = "explorer" })[1]
            if explorer then
              if explorer:is_focused() then
                explorer:close()
              else
                explorer:focus()
              end
            else
              require("snacks").picker.explorer {
                win = {
                  input = { keys = { ["<Esc>"] = false } },
                  list = { keys = { ["<Esc>"] = false } },
                },
              }
            end
          end,
          desc = "Snacks Explorer",
        }
        maps.n["<space>"] = {
          function()
            if #vim.t.bufs > 1 then
              require("snacks").picker.buffers {
                current = false,
                preview = "none",
                layout = { preset = "vscode" },
                on_show = function() vim.cmd.stopinsert() end,
                win = { input = { keys = { ["<Space>"] = { "confirm", mode = { "n", "i" } } } } },
              }
            end
          end,
          desc = "Find buffers",
        }
      end,
    },
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  },
}
