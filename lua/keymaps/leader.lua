local map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

map('n', 's', '<cmd>w<cr>', { desc = 'Save current buffer' })
map('n', 'S', '<cmd>w<cr>', { desc = 'Save all buffers' })
map('n', 'x', '<cmd>qa<cr>', { desc = 'Quit all' })
map('n', 'X', '<cmd>qa!<cr>', { desc = 'Quit all with force' })
map('n', 'e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
map('n', 'R', ':%s:', { desc = 'Replace in buffer' })
map('n', 'y', '"+y', { desc = 'Copy to clipboard' })
