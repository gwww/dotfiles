-- Configuring lsp servers
local U = require("utils")

require("lspconfig").pyright.setup({
    on_attach = function()
        U.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = 0 })
    end,
    flags = { debounce_text_changes = 300 },
    settings = {
        python = { analysis = { extraPaths = { ".." } } },
    },
    _upgrade = "npm upgrade -g pyright",
})
