local wk = require("which-key")

wk.register({
  j = {
    name = 'Easy Motion',
    w = { '<cmd>HopWord<cr>', 'By Word' },
    l = { '<cmd>HopVertical<cr>', 'By Line' },
    a = { '<cmd>HopAnywhere<cr>', 'Anywhere' },
  },
  w = { '<cmd>w<cr>', 'Save' },
  q = { '<cmd>q<cr>', 'Quit' },

  f = {
    name = 'Telescope',
    f = { '<cmd>Telescope find_files<cr>', 'Find Files' },
    b = { '<cmd>Telescope buffers<cr>', 'Find Buffers' },
    g = { '<cmd>Telescope live_grep<cr>', 'ripgrep' },
    h = { '<cmd>Telescope help_tags<cr>', 'Help Tags' },
    n = { '<cmd>Telescope notify<cr>', 'Notify history' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
  },

  e = { '<cmd>NvimTreeToggle<cr>', 'Toggle Nvim Tree' },
  h = { '<cmd>set hlsearch!<cr>', 'Toggle Search Highlighting' },

  b = {
    name = 'Buffer',
    c = { '<cmd>bd<cr>', 'Close Current Buffer' },
  },

  l = {
    name = 'Language',
    f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format current buffer' },
  }

},
  { prefix = "<leader>", mode = "n" }
)

-- Move Lines up and down
-- wk.register({
--   ['<A-j>'] = { 'ddjP', 'Move Current Line Down' },
--   ['<A-k>'] = { 'ddkP', 'Move Current Line Up' },
--   }
-- )
-- wk.register({
--   ['<A-j>'] = { "", "Move Selection Down" },
--   ['<A-k>'] = { "", "Move Selection Up" },
-- },
-- { mode = "v"}
-- )


wk.register({
  j = {
    name = 'Easy Motion',
    w = { '<cmd>HopWord<cr>', 'By Word' },
    l = { '<cmd>HopVertical<cr>', 'By Line' },
    a = { '<cmd>HopAnywhere<cr>', 'Anywhere' },
  }
},
  { prefix = "<leader>", mode = "v" }
)

-- Use system clipboard
wk.register(
{
  y = { '"+y', "Copy to clipboard" },
  Y = { '"+yg_', "Copy to clipboard" },
  p = { '"+p', "Paste from clipboard" },
  P = { '"+P', "Paste from clipboard" }
},
{ mode = 'n', prefix = "<leader>" }
)
wk.register(
{
  y = { '"+y', "Copy to clipboard" },
  p = { '"+p', "Paste from clipboard" },
  P = { '"+P', "Paste from clipboard" }
},
{ mode = 'v', prefix = "<leader>" }
)
