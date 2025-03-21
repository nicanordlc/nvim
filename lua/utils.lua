local M = {}

---Set a variable on all buffers
---@param variable_name string
---@param value any
M.set_variable_on_all_buffers = function(variable_name, value)
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    vim.api.nvim_buf_set_var(buf, variable_name, value)
  end
end

return M
