---Format text to get basename based on the snippets directory.
---@param text string
local format_path = function(text)
  local lua_snippets_match = text:find 'lua/snippets' or 1
  return text:sub(lua_snippets_match, text:len())
end

---Tries to load a file if not, error is notified.
---@param filepath string
return function(filepath)
  local file_loader = loadfile(filepath)
  ---@diagnostic disable-next-line: param-type-mismatch
  local success = pcall(file_loader)

  if not success then
    local message = string.format("'%s' did not load correctly.", format_path(filepath))
    vim.notify(message, vim.log.levels.INFO, { title = 'Load Snippets' })
  end
end
