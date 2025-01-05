local map = function(key, callback, opts)
  vim.keymap.set('n', '<leader>' .. key, callback, opts)
end

map('s', '<cmd>w<cr>', { desc = 'Save current buffer' })
map('S', '<cmd>wa<cr>', { desc = 'Save all buffers' })
map('x', '<cmd>qa<cr>', { desc = 'Quit all' })
map('X', '<cmd>qa!<cr>', { desc = 'Quit all with force' })
map('e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
map('R', ':%s;', { desc = 'Replace in buffer' })
map('y', '"+y', { desc = 'Copy to clipboard' })
map('qb', '<cmd>bd<cr>', { desc = '[Q]uit [B]uffer' })
map('qa', '<cmd>bufdo bd<cr>', { desc = '[Q]uit [A]ll buffers' })
