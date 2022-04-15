local api = vim.api

local U = {}
U.mappings = {}

function U.nvim_set_keymap_shim(mode, lhs, rhs, options)
    local key = mode .. lhs
    if U.mappings[key] then
        print("Duplicate key mapping: ", key, rhs)
    else
        U.mappings[key] = 1
    end
    U.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Create a shim so that nvim_set_keymap can be wrapped
function U.setup_nvim_set_keymap_shim(mode, lhs, rhs, opts)
    U.nvim_set_keymap = _G.vim.api.nvim_set_keymap
    _G.vim.api.nvim_set_keymap = U.nvim_set_keymap_shim
end

-- Key mapping
function U.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true, expr = false }

    if type(rhs) == "function" then
        options.callback = rhs
        rhs = ""
    end
    if opts then
        options = vim.tbl_extend("keep", opts, options)
    end

    local buffer = options.buffer
    if buffer then
        options.buffer = nil
        api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
    else
        api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

return U
