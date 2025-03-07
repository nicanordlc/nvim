local M = {}

M.N = function(key, callback, opts)
  vim.keymap.set('n', key, callback, opts)
end

M.L = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<leader>' .. key, callback, opts)
end

M.LL = function(mode, key, callback, opts)
  vim.keymap.set(mode, '<localleader>' .. key, callback, opts)
end

return M
