local snippet_files = vim.api.nvim_get_runtime_file('lua/snippets/*.lua', true)

for _, snippet_path in ipairs(snippet_files) do
  local basename = vim.fn.fnamemodify(snippet_path, ':t')
  if basename ~= 'init.lua' and basename ~= 'utils.lua' then
    loadfile(snippet_path)()
  end
end
