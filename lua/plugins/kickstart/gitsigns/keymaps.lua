local M = {}

M.setup = function(bufnr)
  local gitsigns = require 'gitsigns'

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    opts.desc = 'git ' .. opts.desc
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  map('n', ']c', function()
    if vim.wo.diff then
      vim.cmd.normal { ']c', bang = true }
    else
      gitsigns.nav_hunk 'next'
    end
  end, { desc = 'Jump to next git [c]hange' })

  map('n', '[c', function()
    if vim.wo.diff then
      vim.cmd.normal { '[c', bang = true }
    else
      gitsigns.nav_hunk 'prev'
    end
  end, { desc = 'Jump to previous git [c]hange' })

  -- Actions
  -- visual mode
  map('v', '<leader>hs', function()
    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
  end, { desc = '[s]tage hunk' })
  map('v', '<leader>hr', function()
    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
  end, { desc = '[r]eset hunk' })
  -- normal mode
  map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
  map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
  map('n', '<leader>hS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
  map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = '[u]ndo stage hunk' })
  map('n', '<leader>hR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
  map('n', '<leader>hp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
  map('n', '<leader>hb', gitsigns.blame_line, { desc = '[b]lame line' })
  map('n', '<leader>hd', gitsigns.diffthis, { desc = '[d]iff against index' })
  map('n', '<leader>hD', function()
    gitsigns.diffthis '@'
  end, { desc = '[D]iff against last commit' })
  -- Toggles
  map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'toggle git show [b]lame line' })
  map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = 'toggle git show [D]eleted' })
end

return M
