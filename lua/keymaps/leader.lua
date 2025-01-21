local map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

map('n', 'x', '<cmd>qa<cr>', { desc = 'Close neovim' })
map('n', 'X', '<cmd>qa!<cr>', { desc = 'Close neovim forced' })
map('n', 'e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
map({ 'n', 'v' }, 'R', function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'V' then
    vim.api.nvim_feedkeys(':s;', 'n', false)
  else
    vim.api.nvim_feedkeys(':%s;', 'n', false)
  end
end, { desc = '[R]eplace in buffer' })
map({ 'n', 'v' }, 'y', '"+y', { desc = '[y]ank to clipboard' })
-- group: q
map('n', 'qb', '<cmd>bd<cr>', { desc = 'quit [b]uffer' })
map('n', 'qa', '<cmd>bufdo bd<cr>', { desc = 'quit [a]ll buffers' })
-- group: p
map('n', 'pl', function()
  require('persistence').load()
end, { desc = 'persistence [l]oad' })
map('n', 'ps', function()
  require('persistence').select()
end, { desc = 'persistence [s]elect' })
