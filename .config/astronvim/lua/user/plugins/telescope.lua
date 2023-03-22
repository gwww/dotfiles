return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local builtin = require "telescope.builtin"
    local state = require "telescope.actions.state"

    return require("astronvim.utils").extend_tbl(opts, {
      defaults = {
        prompt_prefix = " λ  ",
        mappings = {
          i = {
            jk = require("telescope.actions").close,
          },
        },
      },
      pickers = {
        buffers = {
          prompt_prefix = " Select buffer>  ",
          sort_mru = true,
          initial_mode = "normal",
          path_display = { "smart" },
          ignore_current_buffer = true,
          entry_maker = require("user.telescope.buffer_entry").gen_from_buffer(),
          mappings = {
            n = {
              c = require("telescope.actions").delete_buffer,
              ["<space>"] = require("telescope.actions").select_default,
              ["<C-Space>"] = function() builtin.find_files { default_text = state.get_current_line() } end,
            },
            i = {
              ["<C-Space>"] = function() builtin.find_files { default_text = state.get_current_line() } end,
            },
          },
        },
        find_files = {
          mappings = {
            n = {
              ["<C-Space>"] = function() builtin.buffers { default_text = state.get_current_line() } end,
            },
            i = {
              ["<C-Space>"] = function() builtin.buffers { default_text = state.get_current_line() } end,
            },
          },
        },
      },
    })
  end,
}
