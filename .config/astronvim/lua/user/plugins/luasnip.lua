return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    plugin.default_config(opts)
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/astronvim/snippets" } })
  end,
}
