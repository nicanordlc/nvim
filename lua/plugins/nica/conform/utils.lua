local M = {}

-- Disable "format_on_save lsp_fallback" for languages that don't
-- have a well standardized coding style. You can add additional
-- languages here or re-enable it for the disabled ones.
M.get_lsp_format_opt = function()
  local bufnr = vim.fn.bufnr()
  local disable_filetypes = {
    c = true,
    cpp = true,
    typescript = true,
  }
  local lsp_format_opt
  if disable_filetypes[vim.bo[bufnr].filetype] then
    lsp_format_opt = 'never'
  else
    lsp_format_opt = 'fallback'
  end
  return lsp_format_opt
end

M.eslint_format = function()
  if vim.fn.exists 'EslintFixAll' then
    vim.cmd 'EslintFixAll'
  end
  -- return empty so conform api does not break
  return {}
end

return M
