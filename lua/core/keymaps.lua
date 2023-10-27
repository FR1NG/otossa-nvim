vim.g.mapleader = ' '
vim.wo.number = true
vim.opt.clipboard="unnamed,unnamedplus"
vim.opt.termguicolors = true
vim.opt.wrap = false


vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<cr>', { silent = true})
vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true})
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true})
vim.keymap.set('n', '<leader>c', '<cmd>bd#<cr>', { silent = true})
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true})
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true})
vim.keymap.set('n', '<C-h>', '<C-W>h', { silent = true})
vim.keymap.set('n', '<C-l>', '<C-W>l', { silent = true})
vim.keymap.set('i', 'jj', '<Esc>', { silent = true})

