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
                sort_lastused = true,
                initial_mode = "normal",
                mappings = {
                    n = {
                        d = require('telescope.actions').delete_buffer,
                    },
                },
            },
        },
    },
}
