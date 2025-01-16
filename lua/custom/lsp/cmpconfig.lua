local cmp = require'cmp'
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documention = cmp.config.window.bordered(),

  },
  mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            cmp.confirm({ select = true, })
          end
        else
          fallback()
        end
      end),
      ['<C-k>'] = cmp.mapping({
        i = function()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end,
        c = function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'copilot', group_index = 1},
  }
  )
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = {disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup{capabilities = capabilities}
  -- require('lspconfig')['beautysh'].setup{capabilities = capabilities}
  require('lspconfig')['cmake'].setup{capabilities = capabilities}


cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
