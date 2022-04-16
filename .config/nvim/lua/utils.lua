local api = vim.api

local U = {}

function U.map(mode, lhs, rhs, opts)
    local options = { silent = true, expr = false }
    if opts then
        options = vim.tbl_extend("keep", opts, options)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

return U
