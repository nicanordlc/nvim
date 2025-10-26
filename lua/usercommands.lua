local utils = require 'utils'
local set_variable_on_all_buffers = utils.set_variable_on_all_buffers

-- disable autoformat
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- disable only for buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
  vim.notify('Format disabled on this buffer', vim.log.levels.INFO, { title = 'FormatDisable' })
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

-- enable autoformat
vim.api.nvim_create_user_command('FormatEnable', function(args)
  if args.bang then
    vim.b.disable_autoformat = false
  else
    vim.g.disable_autoformat = false
    set_variable_on_all_buffers('disable_autoformat', false)
  end
  vim.notify('Format enabled on this buffer', vim.log.levels.INFO, { title = 'FormatEnable' })
end, {
  desc = 'Re-enable autoformat-on-save',
  bang = true,
})
