vim.keymap.set({ 'n', 'v' }, ';', ':', { desc = 'Enter command mode' })

require 'keymaps.normal'
require 'keymaps.leader'
require 'keymaps.localleader'
