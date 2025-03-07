local mapL = require('keymaps.map').L
local mapN = require('keymaps.map').N

local M = {}

M.setup = function()
  -- set index for moving to buffer 1-9
  for i = 1, 9, 1 do
    mapL('n', i, '<cmd>BufferGoto ' .. i .. '<cr>', { desc = 'Go to buffer [' .. i .. ']' })
  end

  -- leader
  mapL('n', 'qb', '<cmd>BufferClose<cr>', { desc = 'quit [b]uffer' })
  mapL('n', 'qB', '<cmd>BufferClose!<cr>', { desc = 'quit [b]uffer' })
  mapL('n', 'qa', '<cmd>BufferCloseAllButCurrent<cr>', { desc = 'quit [a]ll but current/pinned' })
  mapL('n', '<leader>b', '<cmd>BufferPick<cr>', { desc = 'fuzzy find [b]uffer' })
  mapL('n', '>', '<cmd>BufferMoveNext<cr>', { desc = 'Move buffer right' })
  mapL('n', '<', '<cmd>BufferMovePrevious<cr>', { desc = 'Move buffer left' })

  -- normal
  mapN(']b', '<cmd>BufferNext<cr>', { desc = 'Next [b]uffer' })
  mapN('[b', '<cmd>BufferPrevious<cr>', { desc = 'Previous [b]uffer' })
end

return M
