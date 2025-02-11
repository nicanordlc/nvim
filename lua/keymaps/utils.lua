local M = {}

---Quit and adds extra logic when quitting
---@param opts? { force: boolean }
---@return function
M.checkQuit = function(opts)
  opts = opts or {}

  return function()
    local diffview_active = require('plugins.nica.diffview.options').active
    local git_edit_stash_active = vim.g.ges

    if diffview_active or git_edit_stash_active or opts.force then
      require('persistence').stop()
    end

    if opts.force then
      vim.cmd 'qa!'
    else
      vim.cmd 'qa'
    end
  end
end

return M
