local map = function(lhs, rhs, opts)
  rhs = ':<c-u>normal! ' .. rhs .. '<cr>'
  opts = vim.tbl_extend('keep', opts, { noremap = true, silent = true })
  -- o: operator-pending mode
  -- x: visual mode
  vim.keymap.set({ 'o', 'x' }, lhs, rhs, opts)
end

map('il', '^v$', { desc = 'inner line' })
map('al', '0v$', { desc = 'around line' })
map('ie', 'ggVG', { desc = 'inner entire' })
