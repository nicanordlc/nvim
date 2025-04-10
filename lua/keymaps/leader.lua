local checkQuit = require('keymaps.utils').checkQuit

local M = {}

M.map = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

M.setup = function()
  M.map('n', 'w', '<cmd>w<cr>', { desc = '[w]rite current buffer' })
  M.map('n', 'W', '<cmd>wa<cr>', { desc = '[W]rite all buffers' })

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
    vim.notify('Session restored', vim.log.levels.INFO, { title = 'Persistence' })
  end, { desc = 'persistence [o]pen session' })
  M.map('n', 'ps', function()
    require('persistence').select()
  end, { desc = 'persistence [s]elect' })
  M.map('n', 'pq', function()
    require('persistence').stop()
    vim.notify('Session stopped', vim.log.levels.INFO, { title = 'Persistence' })
  end, { desc = 'persistence [q]uit' })
  M.map('n', 'pp', function()
    vim.g.persistence_disabled = false
    vim.notify('Session started', vim.log.levels.INFO, { title = 'Persistence' })
  end, { desc = 'persistence [p]roceed' })

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
