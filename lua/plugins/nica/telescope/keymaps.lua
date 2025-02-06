local mapL = require('keymaps.leader').map
local utils = require 'plugins.nica.telescope.utils'

local M = {}

local mapS = function(key, callback, opts)
  local desc_prefix = 'search'
  local options = vim.tbl_extend('force', opts, {
    desc = desc_prefix .. ' ' .. opts.desc,
  })
  vim.keymap.set('n', '<leader>s' .. key, callback, options)
end

M.setup = function()
  -- See `:help telescope.builtin`
  local builtin = require 'telescope.builtin'
  mapS('h', builtin.help_tags, { desc = '[h]elp' })
  mapS('k', builtin.keymaps, { desc = '[k]eymaps' })
  mapS('f', function()
    builtin.find_files { hidden = true }
  end, { desc = '[f]iles' })
  mapS('s', builtin.builtin, { desc = '[s]elect Telescope' })
  mapS('w', builtin.grep_string, { desc = 'current [w]ord' })
  mapS('g', builtin.live_grep, { desc = 'by [g]rep' })
  mapS('d', builtin.diagnostics, { desc = '[d]iagnostics' })
  mapS('r', builtin.resume, { desc = '[r]esume' })
  mapS('.', builtin.oldfiles, { desc = 'recent Files ("." for repeat)' })
  mapS('b', builtin.buffers, { desc = 'existing [b]uffers' })
  mapS('c', builtin.commands, { desc = '[c]ommands' })

  -- It's also possible to pass additional configuration options.
  --  See `:help telescope.builtin.live_grep()` for information about particular keys
  mapS('/', function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end, { desc = '[/] in Open Files' })

  -- Shortcut for searching your Neovim configuration files
  mapS('n', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config', follow = true }
  end, { desc = '[n]eovim files' })

  -- search on plugins source
  mapS('p', function()
    builtin.find_files { cwd = (vim.fn.stdpath 'data') .. '/lazy', follow = true }
  end, { desc = '[p]lugin files' })

  -- Slightly advanced example of overriding default behavior and theme
  mapL('n', '/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  -- autocomplete line with telescope
  vim.keymap.set('i', '<C-x><C-l>', function()
    utils.complete_line()
  end, { noremap = true, silent = true })
end

return M
