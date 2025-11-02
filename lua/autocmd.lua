-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- restore-cursor
vim.api.nvim_create_autocmd('BufRead', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        local buf_lines = vim.api.nvim_buf_line_count(opts.buf)
        local not_git = not (ft:match 'commit' and ft:match 'rebase')
        if not_git and last_known_line > 1 and last_known_line <= buf_lines then
          vim.api.nvim_feedkeys([[g`"]], 'nx', false)
          vim.api.nvim_command 'normal zz'
        end
      end,
    })
  end,
})
