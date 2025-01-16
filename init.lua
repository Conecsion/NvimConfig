-- Show both relative and absolute line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s %l %r"

-- Set scrolloff
vim.o.scrolloff = 15

-- Set leader key before Lazy
vim.g.mapleader = ' '

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Set search ignorecase
vim.opt.ignorecase = true

-- Set maximum textwidth
-- vim.opt.textwidth = 80

-- Lazy
require('lazyvim')

-- lsp misc
require('custom.lsp.lsp_config')


-- Set TabStop
vim.o.tabstop = 2 -- A TAB character looks like 2 spaces
vim.o.expandtab = true -- TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting


-- Enable nvim-notify
-- vim.notify = require('notify')

-- NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-cmp
require('custom.lsp.cmpconfig')
