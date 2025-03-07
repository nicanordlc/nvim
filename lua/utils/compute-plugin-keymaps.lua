local try_loadfile = require 'utils.try-loadfile'
local PLUGIN_BASE_DIRECTORY = vim.fs.joinpath('lua', 'plugins')

---Loads all `keymaps.lua` files from the specified plugin directory
---@param plugin_directory string
return function(plugin_directory)
  local pattern = vim.fs.joinpath(PLUGIN_BASE_DIRECTORY, plugin_directory, '**', 'keymaps.lua')
  local keymap_files = vim.api.nvim_get_runtime_file(pattern, true)

  -- -- print(vim.inspect(keymap_files))
  -- for _, filepath in pairs(keymap_files) do
  --   try_loadfile(filepath)
  -- end
end
