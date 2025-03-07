local snippet_files = vim.api.nvim_get_runtime_file('lua/snippets/*.lua', true)

---Format text to get basename based on the snippets directory
---@param text string
local format_path = function(text)
  local lua_snippets_match = text:find 'lua/snippets' or 1
  return text:sub(lua_snippets_match, text:len())
end

for _, snippet_path in ipairs(snippet_files) do
  local basename = vim.fn.fnamemodify(snippet_path, ':t')

  if basename ~= 'init.lua' and basename ~= 'utils.lua' then
    local file_loader = loadfile(snippet_path)
    ---@diagnostic disable-next-line: param-type-mismatch
    local success = pcall(file_loader)

    if not success then
      local message = string.format("'%s' did not load correctly.", format_path(snippet_path))
      vim.notify(message, vim.log.levels.INFO, { title = 'Load Snippets' })
    end
  end
end
