local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set
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

-- Move text
vim.keymap.set('x', "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('x', "<A-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('x', "<A-l>", ">gv", opts)
vim.keymap.set('x', "<A-h>", "<gv", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Toggle Comment.nvim
keymap('n', '<Leader>/', 'gcc', { remap = true })
keymap('v', '<Leader>/', 'gc', { remap = true })

-- Renamer
keymap('n', '<Leader>lr', function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
-- keymap('n', '<leader>lr', ":IncRename ")
