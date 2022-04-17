-- LSP settings
local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<M-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

    -- Causes real slow :BDelete
    -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    -- Why use these??
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wl', function()
    --     vim.inspect(vim.lsp.buf.list_workspace_folders())
    -- end, opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Make lua runtime files discoverable to the server
local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")

local servers = {
    {
        server = "pyright",
        -- settings = { analysis = { extraPaths = { ".." } } },
    },
    {
        server = "sumneko_lua",
        settings = {
            Lua = {
                runtime = { path = lua_rtp },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    -- library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = { enable = false },
            },
        },
    },
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp.server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = lsp.settings,
        flags = { debounce_text_changes = 450 },
    })
end

-- This gives borders on all LSP windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "double"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
