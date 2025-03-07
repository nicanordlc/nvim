local compute_plugin_keymaps = require 'utils.compute-plugin-keymaps'

vim.keymap.set({ 'n', 'v' }, ';', ':', { desc = 'Enter command mode' })

require 'keymaps.normal'
require 'keymaps.leader'
require 'keymaps.localleader'

compute_plugin_keymaps 'nica'
