local wk = require("which-key")

wk.add({
  mode = { 'n', 'v' },
  { "<leader>j", group = "Easy Motion" },
  { "<leader>jw", '<cmd>HopWord<cr>', desc = 'By Word' },
  { "<leader>jl", '<cmd>HopVertical<cr>', desc = 'By Line' },
  { "<leader>ja", '<cmd>HopAnywhere<cr>', desc = 'Anywhere' },
  { 'jk', hidden = true },
  { 'kj', hidden = true },
})

wk.add({
  mode = {'n'},
  { '<leader>f', group = 'Telescope' },
  { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
  { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
  { '<leader>bf', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
  { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'ripgrep' },
  { '<leader>fn', '<cmd>Telescope notify<cr>', desc = 'Notify history' },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags' },
  { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent files' },

  { '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', hidden =true },
  { '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', hidden =true },
  { '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', hidden =true },
  { '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', hidden =true },
  { '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', hidden =true },
  { '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', hidden =true },
  { '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', hidden =true },
  { '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', hidden =true },
  { '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', hidden =true },
  { '<leader>0', '<cmd>BufferLineGoToBuffer 0<cr>', hidden =true },

  { '<leader>bc', '<cmd>bd<cr>', desc = 'Close current buffer' },

  { '<leader>w', '<cmd>w<cr>', desc = 'Save' },
  { '<leader>q', '<cmd>q<cr>', desc = 'Quit' },
  { '<leader>Q', '<cmd>q!<cr>', desc = 'Quit without saving' },

  { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle Nvim Tree' },

  { '<leader>h', '<cmd>set hlsearch!<cr>', desc = 'Toggle Search Highlight' },

  { '<leader>l', group = 'LSP' },
  { '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', desc = 'Format current buffer' },
  { '<leader>lr', '<cmd>LspRestart<cr>', desc = 'Refresh LSP' },

  { '<leader>Y', '"+yg_', desc = 'Copy this line to system clipboard' },
  { '<leader>p', '"+p', desc = 'Paste from clipboard' },
  { '<leader>P', '"+P', hidden = true },

  { '<leader>i', "<cmd>PasteImage<cr>", desc = 'Paste image' },
})

wk.add({
  mode = {'v'},
  { '<leader>y', '"+y', desc = 'Copy to system clipboard' },
})


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
