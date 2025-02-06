local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values

local M = {}

M.complete_line = function()
  pickers
    .new({}, {
      prompt_title = 'Complete Line',
      finder = finders.new_table {
        results = vim.api.nvim_buf_get_lines(0, 0, -1, false),
      },
      sorter = conf.generic_sorter {},
      attach_mappings = function(_, map)
        map('i', '<CR>', function(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          vim.api.nvim_put({ selection[1] }, '', false, true)
        end)
        return true
      end,
    })
    :find()
end

return M
