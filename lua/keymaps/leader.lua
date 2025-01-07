local map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

map('n', 'x', '<cmd>qa<cr>', { desc = 'Quit all' })
map('n', 'X', '<cmd>qa!<cr>', { desc = 'Quit all with force' })
map('n', 'e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
map({ 'n', 'v' }, 'R', ':%s;', { desc = 'Replace in buffer' })
map({ 'n', 'v' }, 'y', '"+y', { desc = 'Copy to clipboard' })
map('n', 'qb', '<cmd>bd<cr>', { desc = '[Q]uit [B]uffer' })
map('n', 'qa', '<cmd>bufdo bd<cr>', { desc = '[Q]uit [A]ll buffers' })
