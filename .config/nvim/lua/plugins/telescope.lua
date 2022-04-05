local U = require("utils")
local finders = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        prompt_prefix = " λ ",
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-o>"] = function()
                    return
                end,
                ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
                ["<C-s>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case", -- smart_case | ignore_case | respect_case
        },
    },
})

U.map("n", "<leader>e", "<cmd>lua require('telescope.builtin').find_files()<cr>")
U.map("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>")
U.map("n", "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
U.map("n", "<leader>/", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
