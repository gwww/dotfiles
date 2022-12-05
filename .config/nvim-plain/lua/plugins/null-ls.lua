local map = require("utils").map
local nls = require("null-ls")

nls.setup({
    sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black,
        nls.builtins.diagnostics.mypy,
        nls.builtins.formatting.isort,
        -- nls.builtins.completion.spell,
    },
})

map("n", "<leader>nf", function() vim.lsp.buf.formatting_sync() end)
