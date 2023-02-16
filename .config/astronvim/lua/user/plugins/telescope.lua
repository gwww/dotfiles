return {
    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            prompt_prefix = " λ  ",
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close
                },
            },
        },
        pickers = {
            buffers = {
                prompt_prefix = " Select buffer>  ",
                -- sort_lastused = true,
                sort_mru = true,
                initial_mode = "normal",
                path_display = { "smart" },
                ignore_current_buffer = true,
                mappings = {
                    n = {
                        d = require('telescope.actions').delete_buffer,
                        ["<space>"] = require("telescope.actions").select_default,
                    },
                },
            },
        },
    },
}
