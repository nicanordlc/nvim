local map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<localleader>' .. key, callback, opts)
end

map('n', 's', '<cmd>w<cr>', { desc = '[s]ave current buffer' })
map('n', 'S', '<cmd>wa<cr>', { desc = '[S]ave all buffers' })
map('n', 'q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', ',', '<C-6>', { desc = 'Go to previous buffer' })
map('n', 'm', '<cmd>messages<cr>', { desc = 'Show [M]essages' })
map('v', 's', '<cmd>sort<cr>', { desc = '[S]ort' })
map('v', 'n', ':normal<space>', { desc = 'Apply [N]ormal mode' })
