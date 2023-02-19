return {
    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            prompt_prefix = " λ  ",
            mappings = {
                i = { jk = require("telescope.actions").close },
            },
        },
        pickers = {
            buffers = {
                prompt_prefix = " Select buffer>  ",
                sort_mru = true,
                initial_mode = "normal",
                path_display = { "smart" },
                ignore_current_buffer = true,
                entry_maker = require "user.telescope.buffer_entry".gen_from_buffer(),
                mappings = {
                    n = {
                        c = require('telescope.actions').delete_buffer,
                        ["<space>"] = require("telescope.actions").select_default,
                    },
                },
            },
        },
    },
}
