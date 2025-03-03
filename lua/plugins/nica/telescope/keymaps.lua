local mapL = require('keymaps.leader').map
local utils = require 'plugins.nica.telescope.utils'

local M = {}

local map = function(key, callback, opts)
  local desc_prefix = 'search'
  local options = vim.tbl_extend('force', opts, {
    desc = desc_prefix .. ' ' .. opts.desc,
  })
  vim.keymap.set('n', '<leader>s' .. key, callback, options)
end

M.setup = function()
  -- See `:help telescope.builtin`
  local builtin = require 'telescope.builtin'
  map('h', builtin.help_tags, { desc = '[h]elp' })
  map('k', builtin.keymaps, { desc = '[k]eymaps' })
  map('f', function()
    builtin.find_files { hidden = true }
  end, { desc = '[f]iles' })
  map('s', builtin.builtin, { desc = '[s]elect Telescope' })
  map('w', builtin.grep_string, { desc = 'current [w]ord' })
  map('g', builtin.live_grep, { desc = 'by [g]rep' })
  map('d', builtin.diagnostics, { desc = '[d]iagnostics' })
  map('r', builtin.resume, { desc = '[r]esume' })
  map('.', builtin.oldfiles, { desc = 'recent Files ("." for repeat)' })
  map('b', builtin.buffers, { desc = 'existing [b]uffers' })
  map('c', builtin.commands, { desc = '[c]ommands' })
  map('D', '<cmd>GrepInDirectory<cr>', { desc = 'words in [D]irectory' })
  map('F', '<cmd>FileInDirectory<CR>', { desc = '[F]iles in directory' })

  -- It's also possible to pass additional configuration options.
  --  See `:help telescope.builtin.live_grep()` for information about particular keys
  map('/', function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end, { desc = '[/] in Open Files' })

  -- Shortcut for searching your Neovim configuration files
  map('n', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config', follow = true }
  end, { desc = '[n]eovim files' })

  -- search on plugins source
  map('p', function()
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
