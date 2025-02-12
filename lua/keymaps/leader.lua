local checkQuit = require('keymaps.utils').checkQuit

local M = {}

M.map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

M.setup = function()
  M.map('n', 'x', checkQuit(), { desc = 'Close neovim' })
  M.map('n', 'X', checkQuit { force = true }, { desc = 'Close neovim forced' })
  M.map('n', 'e', '<cmd>e!<cr>', { desc = 'Force edit on current buffer' })
  M.map({ 'n', 'v' }, 'y', '"+y', { desc = '[y]ank to clipboard' })
  -- group: g (git)
  M.map('n', 'gd', '<cmd>DiffviewOpen<cr>', { desc = 'git [d]iff view' })
  M.map('n', 'gq', '<cmd>DiffviewClose<cr>', { desc = 'git [q]uit diff' })
  M.map('n', 'gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'git file [h]istory' })
  -- group: q (quit)
  M.map('n', 'qt', '<cmd>tabclose<cr>', { desc = 'quit [t]ab' })

  -- group: p (persistence)
  M.map('n', 'po', function()
    require('persistence').load()
  end, { desc = 'persistence [o]pen session' })
  M.map('n', 'ps', function()
    require('persistence').select()
  end, { desc = 'persistence [s]elect' })
  M.map('n', 'pq', function()
    require('persistence').stop()
  end, { desc = 'persistence [q]uit' })

  -- replace in buffer
  M.map({ 'n', 'v' }, 'R', function()
    local mode = vim.api.nvim_get_mode().mode
    if mode == 'V' then
      vim.api.nvim_feedkeys(':s;', 'n', false)
    else
      vim.api.nvim_feedkeys(':%s;', 'n', false)
    end
  end, { desc = '[R]eplace in buffer' })
end

return M
