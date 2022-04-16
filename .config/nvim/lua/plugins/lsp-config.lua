-- Configuring lsp servers
local map = require("utils").map

require("lspconfig").pyright.setup({
    on_attach = function()
        map("n", "K", function()
            vim.lsp.buf.hover()
        end, { buffer = true })
    end,
    flags = { debounce_text_changes = 300 },
    settings = {
        python = { analysis = { extraPaths = { ".." } } },
    },
    _upgrade = "npm upgrade -g pyright",
})
