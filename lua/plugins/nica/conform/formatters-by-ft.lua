---@class OptionsSpec
---@field disabled? boolean
---@field lsp_disabled? boolean
---@field settings? table|function

---@class FormattersByFT
---@field [1] string|string[]
---@field [2] OptionsSpec

---@type FormattersByFT[]
local formatters_by_ft = {
  { 'lua', { settings = { 'stylua' } } },
  { 'c', { disabled = true } },
  { 'cpp', { disabled = true } },
  {
    { 'javascript', 'typescript', 'typescriptreact' },
    {
      lsp_disabled = true,
      settings = function()
        local cmd = ':EslintFixAll'
        if vim.fn.exists(cmd) > 0 then
          vim.cmd(cmd)
        end
        -- return empty so conform api doesn't break
        return {}
      end,
    },
  },
}

return formatters_by_ft
