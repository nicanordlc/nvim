local formatters_by_ft = require 'plugins.nica.conform.formatters-by-ft'

local M = {}

M.get_formatters_by_ft = function()
  local formatters_by_ft_return = {}

  M.get_formatters_metadata(function(filetypes, opts)
    for _, filetype in ipairs(filetypes) do
      if not opts.disabled then
        formatters_by_ft_return[filetype] = opts.settings
      end
    end
  end)

  return formatters_by_ft_return
end

---@alias MetadataCallback fun(filetypes:string[],opts:OptionsSpec)

---Loop through filetypes and its options
---@param callback MetadataCallback
---@return nil
M.get_formatters_metadata = function(callback)
  local cb = type(callback) == 'function' and callback or function(...) end

  for _, ft_spec in ipairs(formatters_by_ft) do
    if #ft_spec < 2 then
      goto continue
    end

    local filetypes = ft_spec[1]
    local opts = ft_spec[2]

    opts.disabled = opts.disabled or false
    opts.lsp_disabled = opts.lsp_disabled or false
    opts.settings = opts.settings or {}

    filetypes = type(filetypes) == 'string' and { filetypes } or filetypes

    cb(filetypes, opts)

    ::continue::
  end
end

M.get_lsp_format_opt = function()
  local bufnr = vim.fn.bufnr()
  local filetype = vim.bo[bufnr].filetype
  local lsp_format_opt = 'fallback'

  M.get_formatters_metadata(function(filetypes, opts)
    for _, _filetype in ipairs(filetypes) do
      if _filetype == filetype and (opts.disabled or opts.lsp_disabled) then
        lsp_format_opt = 'never'
      end
    end
  end)

  return lsp_format_opt
end

return M
