local map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

map('n', 'x', '<cmd>qa<cr>', { desc = 'Close neovim' })
map('n', 'X', '<cmd>qa!<cr>', { desc = 'Close neovim forced' })
map('n', 'e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
map({ 'n', 'v' }, 'R', ':%s;', { desc = '[R]eplace in buffer' })
map({ 'n', 'v' }, 'y', '"+y', { desc = '[y]ank to clipboard' })
-- group: q
map('n', 'qb', '<cmd>bd<cr>', { desc = 'quit [b]uffer' })
map('n', 'qa', '<cmd>bufdo bd<cr>', { desc = 'quit [a]ll buffers' })
