local map = function(key, callback, opts)
  vim.keymap.set('n', key, callback, opts)
end

map('<C-r>', '<nop>')
map('U', '<C-r>', { desc = 'Redo' })
map(';', ':', { desc = 'Enter command mode' })
map('<Esc>', '<cmd>nohlsearch<CR>')
