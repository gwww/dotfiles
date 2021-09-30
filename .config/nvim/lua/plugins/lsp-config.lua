-- Configuring lsp servers

require('lspconfig').pyright.setup {
  settings = {
    python = {analysis = {extraPaths = {".."}}}
  },
  _upgrade = 'npm upgrade -g pyright',
}
