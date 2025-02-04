vim.keymap.set({ 'n', 'v' }, ';', ':', { desc = 'Enter command mode' })

require('keymaps.normal').setup()
require('keymaps.leader').setup()
require 'keymaps.localleader'
