local U = require("utils")
local nls = require("null-ls")

nls.setup({
    sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
        -- nls.builtins.completion.spell,
    },
})

U.map("n", "<leader>nf", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>")
