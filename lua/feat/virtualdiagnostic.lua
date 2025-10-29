local toggle_lines = function(toggled)
  vim.diagnostic.config {
    virtual_lines = toggled and { current_line = true } or false,
    virtual_text = not toggled,
  }
end

vim.api.nvim_create_autocmd('WinResized', {
  callback = function()
    local width = vim.api.nvim_win_get_width(0)
    if width < 100 then
      toggle_lines(false)
    else
      toggle_lines(true)
    end
  end,
})
