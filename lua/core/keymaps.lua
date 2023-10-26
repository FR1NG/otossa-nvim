vim.g.mapleader = ' '
vim.wo.number = true
vim.opt.clipboard="unnamed,unnamedplus"

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')
vim.keymap.set('i', 'jj', '<Esc>')

