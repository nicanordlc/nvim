local map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<localleader>' .. key, callback, opts)
end

-- normal
map('n', 's', '<cmd>w<cr>', { desc = '[s]ave current buffer' })
map('n', 'S', '<cmd>wa<cr>', { desc = '[S]ave all buffers' })
map('n', 'q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })
map('n', ',', '<C-6>', { desc = 'Go to previous buffer' })
map('n', 'm', '<cmd>messages<cr>', { desc = 'Show [m]essages' })
map({ 'n', 'v' }, 'n', ':normal ', { desc = 'Enter [n]ormal mode' })

-- visual
map('v', 's', '<cmd>sort<cr>', { desc = '[s]ort' })
map('v', 'n', ':normal<space>', { desc = 'Apply [n]ormal mode' })
