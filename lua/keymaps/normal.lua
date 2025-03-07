local map = require('keymaps.map').N

map('<C-r>', '<nop>')
map('U', '<C-r>', { desc = 'Redo' })
map('<Esc>', '<cmd>nohlsearch<CR>')
map('0', 'ddp', { desc = 'Move line down' })
map(')', 'ddkP', { desc = 'Move line up' })
map(']t', 'gt', { desc = 'Go to next [T]ab' })
map('[t', 'gT', { desc = 'Go to previous [T]ab' })
map('s', '<nop>')
map('==', '=ip', { desc = 'Indent current paragraph' })
