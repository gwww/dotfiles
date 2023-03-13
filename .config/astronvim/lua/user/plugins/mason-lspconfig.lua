-- List of valid "ensure_installed" items.
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/mappings/server.lua
return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"html",
				"jsonls",
				"pyright",
				"lua_ls",
				"svelte",
				"tailwindcss",
				"tsserver",
				"yamlls",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"black",
				"isort",
				"prettierd",
			},
		},
		-- config = function(_, opts)
		--   local mason_null_ls = require "mason-null-ls"
		--   local null_ls = require "null-ls"
		--   mason_null_ls.setup(opts)
		--   mason_null_ls.setup_handlers {
		--     prettierd = function()
		--       null_ls.register(
		--         null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } }
		--       )
		--     end,
		--   }
		-- end,
	},
}
