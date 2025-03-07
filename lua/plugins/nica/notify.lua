return {
  'rcarriga/nvim-notify',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('notify').setup {}

    vim.notify = require 'notify'
  end,
}
