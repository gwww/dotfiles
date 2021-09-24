if vim.fn.executable("black") == 1 then
  vim.api.nvim_exec([[
    setlocal formatprg=black\ --quiet\ -
    augroup black-fmt
        autocmd!
        autocmd BufWritePre <buffer> keepjumps normal m'gggqG``
    augroup END
  ]], false)
end
