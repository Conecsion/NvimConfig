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
      ['<A-b>'] = cmp.mapping.scroll_docs(-4),
      ['<A-f>'] = cmp.mapping.scroll_docs(4),
      ['<A-Space>'] = cmp.mapping.complete(),
      ['<A-e>'] = cmp.mapping.abort(),
      ['<A-l>'] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false })
            end
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
      ["<A-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<A-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),

    }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'copilot', group_index = 2},
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
