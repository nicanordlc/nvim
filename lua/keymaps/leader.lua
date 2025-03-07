local map = require('keymaps.map').L
local checkQuit = require('keymaps.utils').checkQuit

map('n', 'x', checkQuit(), { desc = 'Close neovim' })
map('n', 'X', checkQuit { force = true }, { desc = 'Close neovim forced' })
map('n', 'e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
map({ 'n', 'v' }, 'y', '"+y', { desc = '[y]ank to clipboard' })
-- group: g (git)
map('n', 'gd', '<cmd>DiffviewOpen<cr>', { desc = 'git [d]iff view' })
map('n', 'gq', '<cmd>DiffviewClose<cr>', { desc = 'git [q]uit diff' })
map('n', 'gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'git file [h]istory' })
-- group: q (quit)
map('n', 'qt', '<cmd>tabclose<cr>', { desc = 'quit [t]ab' })

-- group: p (persistence)
map('n', 'po', function()
  require('persistence').load()
end, { desc = 'persistence [o]pen session' })
map('n', 'ps', function()
  require('persistence').select()
end, { desc = 'persistence [s]elect' })
map('n', 'pq', function()
  require('persistence').stop()
end, { desc = 'persistence [q]uit' })
map('n', 'pp', function()
  vim.g.persistence_disabled = false
end, { desc = 'persistence [p]roceed' })

-- replace in buffer
map({ 'n', 'v' }, 'R', function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'V' then
    vim.api.nvim_feedkeys(':s;', 'n', false)
  else
    vim.api.nvim_feedkeys(':%s;', 'n', false)
  end
end, { desc = '[R]eplace in buffer' })
