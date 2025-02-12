local ls = require 'luasnip'

local M = {}

M.add_snippets = function(filetypes, ...)
  filetypes = type(filetypes) == 'string' and { filetypes } or filetypes

  for _, filetype in ipairs(filetypes) do
    ls.add_snippets(filetype, ...)
  end
end

return M
