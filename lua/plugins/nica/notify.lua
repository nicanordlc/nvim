return {
  'rcarriga/nvim-notify',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('notify').setup {
      level = vim.log.levels.DEBUG,
    }

    vim.notify = require 'notify'
  end,
}
