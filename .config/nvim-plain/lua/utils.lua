local U = {}

-- vim.keymap.set got it almost perfect, except for default for silent
function U.map(mode, lhs, rhs, opts)
    opts = opts or {}
    if opts.silent == nil then opts.silent = true end
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Check to duplicate mappings; leave this disabled most of the time
-- U.all_key_mappings = {}
-- local orig_nvim_set_keymap = vim.api.nvim_set_keymap
-- vim.api.nvim_set_keymap = function(mode, lhs, rhs, opts)
--     local mapping = mode .. lhs
--     if U.all_key_mappings[mapping] == nil then
--         U.all_key_mappings[mapping] = true
--     else
--         print("Warning: mapping reused " .. mapping .. vim.inspect(rhs))
--         print("Warning: mapping reused " .. mapping .. rhs)
--     end
--     return orig_nvim_set_keymap(mode, lhs, rhs, opts)
-- end

return U
