vim.keymap.set({'i','v'},'jk','<Esc>')
-- vim.keymap.set('n','<Leader>w', ':w<cr>')
-- vim.keymap.set('n','<Leader>q', ':q<cr>')
vim.keymap.set('n', 'wk', ':q<cr>')

-- Toggle Nvim Tree
vim.keymap.set('n', '<F3>', ':NvimTreeToggle<cr>')

-- Toggle FTerm
vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Keep visual mode after indent
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', 'G', 'Gzz')
