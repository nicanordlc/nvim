---Installs the linter binary and returns the name so
---the lint knows how to call the binary.
---
---@param opts { name: string, suffix: string }
---@return string
local ensure_installed = function(opts)
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

return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { ensure_installed { 'markdownlint', '-cli' } },
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
