local map = function(key, callback, opts)
  vim.keymap.set('n', '<localleader>' .. key, callback, opts)
end

map('q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map(',', '<C-6>', { desc = 'Go to previous buffer' })
map('m', '<cmd>messages<cr>', { desc = 'Show [M]essages' })
