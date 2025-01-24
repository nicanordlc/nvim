local map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

map('n', 'x', '<cmd>qa<cr>', { desc = 'Close neovim' })
map('n', 'e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
map({ 'n', 'v' }, 'y', '"+y', { desc = '[y]ank to clipboard' })
-- group: g (git)
map('n', 'gd', '<cmd>DiffviewOpen<cr>', { desc = 'git [d]iff view' })
map('n', 'gc', '<cmd>DiffviewClose<cr>', { desc = 'git [c]lose diff' })
map('n', 'gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'git file [h]istory' })
-- group: q (quit)
map('n', 'qb', '<cmd>bd<cr>', { desc = 'quit [b]uffer' })
map('n', 'qa', '<cmd>bufdo bd<cr>', { desc = 'quit [a]ll buffers' })
map('n', 'qt', '<cmd>tabclose<cr>', { desc = 'quit [t]ab' })

-- group: p (persistence)
map('n', 'po', function()
  require('persistence').load()
end, { desc = 'persistence [o]pen session' })
map('n', 'ps', function()
  require('persistence').select()
end, { desc = 'persistence [s]elect' })

-- replace in buffer
map({ 'n', 'v' }, 'R', function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'V' then
    vim.api.nvim_feedkeys(':s;', 'n', false)
  else
    vim.api.nvim_feedkeys(':%s;', 'n', false)
  end
end, { desc = '[R]eplace in buffer' })

-- close nvim forced
map('n', 'X', function()
  require('persistence').stop()
  vim.cmd 'qa!'
end, { desc = 'Close neovim forced' })
