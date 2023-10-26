vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')
vim.keymap.set('i', 'jj', '<Esc>')

-- nvim tree mappings
local api = require('nvim-tree.api')
vim.keymap.set('n', 'l',   api.node.open.edit)
