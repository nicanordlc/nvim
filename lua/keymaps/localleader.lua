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
local resize_num = 4
map('n', 'h', '<cmd>vertical resize +' .. resize_num .. '<cr>', { desc = 'resize right' })
map('n', 'j', '<cmd>resize +' .. resize_num .. '<cr>', { desc = 'resize down' })
map('n', 'k', '<cmd>resize -' .. resize_num .. '<cr>', { desc = 'resize up' })
map('n', 'l', '<cmd>vertical resize -' .. resize_num .. '<cr>', { desc = 'resize left' })

-- visual
map('v', 's', '<cmd>sort<cr>', { desc = '[s]ort' })
map('v', 'n', ':normal<space>', { desc = 'Apply [n]ormal mode' })
