local M = {}

M.map = function(key, callback, opts)
  vim.keymap.set('n', key, callback, opts)
end

M.setup = function()
  M.map('<C-r>', '<nop>')
  M.map('U', '<C-r>', { desc = 'Redo' })
  M.map('<Esc>', '<cmd>nohlsearch<CR>')
  M.map('0', 'ddp', { desc = 'Move line down' })
  M.map(')', 'ddkP', { desc = 'Move line up' })
  M.map(']t', 'gt', { desc = 'Go to next [T]ab' })
  M.map('[t', 'gT', { desc = 'Go to previous [T]ab' })
  M.map('s', '<nop>')
  M.map(']b', '<cmd>bnext<cr>', { desc = 'next [b]uffer' })
  M.map('[b', '<cmd>bprevious<cr>', { desc = 'previous [b]uffer' })
end

return M
