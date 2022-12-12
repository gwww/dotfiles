local vscode_kind_icons = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
}

return {
  window = {
    documentation = { max_width = 40 },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format(" %s%s", vscode_kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end,
  },
}
