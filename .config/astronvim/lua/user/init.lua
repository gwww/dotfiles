return {
    colorscheme = "nightfox",

    -- Diagnostics configuration for when diagnostics are on
    diagnostics = {
        underline = false,
        update_in_insert = false,
    },

    lsp = {
        -- Add to the global LSP on_attach function
        on_attach = function(client) client.config.flags["debounce_text_changes"] = 500 end,
    },

    mappings = {
        n = {
            [";"] = { ":", silent = false, desc = "Quick cmd" },
            ["<enter>"] = { ":noh<enter><cr>", silent = true, desc = "No highlight" },
            j = { "v:count==0 ? 'gj' : 'j'", expr = true },
            k = { "v:count==0 ? 'gk' : 'k'", expr = true },
            ["<leader>e"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" },
            ["<leader>E"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
            ["<leader>ff"] = false,
        },
    },

    options = {
        opt = {
            completeopt = "menuone,noinsert,noselect",
            confirm = true, -- Confirm quit on errors
            cmdheight = 1, -- Override cmdheight=0
            linebreak = true, -- Break at "natural" spot on wrap
            relativenumber = false, -- Override
            wrap = true, -- Wrap lines
        },
        g = {
            mapleader = ",",
            maplocalleader = ",",
        },
    },

}
