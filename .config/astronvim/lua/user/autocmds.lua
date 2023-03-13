vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("gwww", { clear = false }),
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - "o"
	end,
})
