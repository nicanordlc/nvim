return {
  'romgrk/barbar.nvim',
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    local barbar = require 'barbar'

    barbar.setup {}

    require('plugins.nica.barbar.keymaps').setup()
  end,
}
