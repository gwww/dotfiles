return {
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

    lsp = {
        -- Add to the global LSP on_attach function
        on_attach = function(client, bufnr) client.config.flags["debounce_text_changes"] = 450 end,
    },

    colorscheme = "nightfox",
}
