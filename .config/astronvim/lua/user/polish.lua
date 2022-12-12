-- This function is run last and is a good place to configuring
-- anything that doesn't fit in the normal config can go here
return function()
  require "user.autocmds"
  vim.on_key(nil, vim.api.nvim_get_namespaces()["auto_hlsearch"])
end
