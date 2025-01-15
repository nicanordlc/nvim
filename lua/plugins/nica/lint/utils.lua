local M = {}

---Installs the linter binary and returns the name so
---the lint knows how to call the binary.
---
---@param opts { name: string, suffix: string }
---@return string
M.ensure_installed = function(opts)
  local name = opts[1]
  local suffix = opts[2] or ''
  local is_executable = vim.fn.executable(name) == 1
  -- install lint binary
  if not is_executable then
    local command = 'yarn global add ' .. name .. suffix
    vim.fn.jobstart(command, {
      detach = true,
      on_exit = function()
        local message = '[lint] Installed: ' .. name
        vim.cmd('echom "' .. message .. '"')
      end,
    })
  end
  -- return linter name
  return name
end

return M
