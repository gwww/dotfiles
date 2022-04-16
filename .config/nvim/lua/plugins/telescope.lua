local map = require("utils").map
local finders = require("telescope.builtin")
local actions = require("telescope.actions")

-- Global for now; fix when 0.7 comes out
glenn_smart_find_files = function()
    local opts = {}
    local ok = pcall(require("telescope.builtin").git_files, opts)
    if not ok then
        require("telescope.builtin").find_files(opts)
    end
end

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

map("n", "<leader>e", function()
    require("telescope.builtin").find_files()
end)
map("n", "<leader>b", function()
    require("telescope.builtin").buffers()
end)
map("n", "<leader>h", function()
    require("telescope.builtin").help_tags()
end)
map("n", "<leader>/", function()
    require("telescope.builtin").live_grep()
end)
