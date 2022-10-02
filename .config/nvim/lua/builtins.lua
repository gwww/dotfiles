local g = vim.g

-- Turn off providers (was because slowed startup)
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- Disable builtin plugins
g.loaded_2html_plugin = 1
g.loaded_gzip = 1
g.loaded_man = 1
g.loaded_matchit = 1
g.loaded_netrwPlugin = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1
