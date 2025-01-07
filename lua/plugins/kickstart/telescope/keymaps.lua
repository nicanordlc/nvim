local M = {}

local map = function(key, callback, opts)
  local desc_prefix = '[s]earch'
  local options = vim.tbl_extend('force', opts, {
    desc = desc_prefix .. ' ' .. opts.desc,
  })
  vim.keymap.set('n', '<leader>s' .. key, callback, options)
end

M.setup = function()
  -- See `:help telescope.builtin`
  local builtin = require 'telescope.builtin'
  map('h', builtin.help_tags, { desc = '[H]elp' })
  map('k', builtin.keymaps, { desc = '[K]eymaps' })
  map('f', builtin.find_files, { desc = '[F]iles' })
  map('s', builtin.builtin, { desc = '[S]elect Telescope' })
  map('w', builtin.grep_string, { desc = 'current [W]ord' })
  map('g', builtin.live_grep, { desc = 'by [G]rep' })
  map('d', builtin.diagnostics, { desc = '[D]iagnostics' })
  map('r', builtin.resume, { desc = '[R]esume' })
  map('.', builtin.oldfiles, { desc = 'recent Files ("." for repeat)' })
  map('b', builtin.buffers, { desc = 'existing [B]uffers' })

  -- Slightly advanced example of overriding default behavior and theme
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

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
  end, { desc = '[N]eovim files' })
end

return M
