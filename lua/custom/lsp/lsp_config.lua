require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'pyright' }
})


require('lspconfig').lua_ls.setup{}
require('lspconfig').pyright.setup{}
require('lspconfig').cssls.setup{}
require('lspconfig').html.setup{}
require('lspconfig').jsonls.setup{}
