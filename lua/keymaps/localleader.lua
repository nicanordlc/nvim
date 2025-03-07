local map = require('keymaps.map').LL
local resize_window_number = 4

-- normal
map('n', 's', '<cmd>w<cr>', { desc = '[s]ave current buffer' })
map('n', 'S', '<cmd>wa<cr>', { desc = '[S]ave all buffers' })
map('n', 'q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })
map('n', ',', '<C-6>', { desc = 'Go to previous buffer' })
map('n', 'm', '<cmd>messages<cr>', { desc = 'Show [m]essages' })
map({ 'n', 'v' }, 'n', ':normal ', { desc = 'Enter [n]ormal mode' })
map('n', 'h', '<cmd>vertical resize +' .. resize_window_number .. '<cr>', { desc = 'resize right' })
map('n', 'j', '<cmd>resize +' .. resize_window_number .. '<cr>', { desc = 'resize down' })
map('n', 'k', '<cmd>resize -' .. resize_window_number .. '<cr>', { desc = 'resize up' })
map('n', 'l', '<cmd>vertical resize -' .. resize_window_number .. '<cr>', { desc = 'resize left' })

-- visual
map('v', 's', ':sort<cr>', { desc = '[s]ort' })
map('v', 'n', ':normal<space>', { desc = 'Apply [n]ormal mode' })
