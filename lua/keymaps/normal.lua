local map = function(key, callback, opts)
  vim.keymap.set('n', key, callback, opts)
end

map('<C-r>', '<nop>')
map('U', '<C-r>', { desc = 'Redo' })
map('<Esc>', '<cmd>nohlsearch<CR>')
map('0', 'ddp', { desc = 'Move line down' })
map(')', 'ddkP', { desc = 'Move line up' })
map(']b', '<cmd>bn!<cr>', { desc = 'Next [B]uffer' })
map('[b', '<cmd>bp!<cr>', { desc = 'Previous [B]uffer' })
map(']t', 'gt<cr>', { desc = 'Go to next [T]ab' })
map('[t', 'gT<cr>', { desc = 'Go to previous [T]ab' })
map('s', '<nop>')
