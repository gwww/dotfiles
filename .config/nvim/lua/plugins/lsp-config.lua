-- Configuring lsp servers

require("lspconfig").pyright.setup({
    flags = { debounce_text_changes = 300 },
    settings = {
        python = { analysis = { extraPaths = { ".." } } },
    },
    _upgrade = "npm upgrade -g pyright",
})
