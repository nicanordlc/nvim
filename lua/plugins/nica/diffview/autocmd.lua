local options = require 'plugins.nica.diffview.options'
local augroup = vim.api.nvim_create_augroup('diffview_active', { clear = true })

vim.api.nvim_create_autocmd('User', {
  group = augroup,
  pattern = 'DiffviewViewOpened',
  callback = function()
    options.active = true
  end,
})

vim.api.nvim_create_autocmd('User', {
  group = augroup,
  pattern = 'DiffviewViewClosed',
  callback = function()
    options.active = false
  end,
})
