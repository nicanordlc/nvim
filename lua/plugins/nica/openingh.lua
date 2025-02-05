return {
  'Almo7aya/openingh.nvim',
  keys = {
    {
      '<leader>gr',
      '<cmd>OpenInGHFile<cr>',
      mode = 'n',
      desc = 'git open file on [r]emote',
    },
    {
      '<leader>gr',
      function()
        vim.api.nvim_feedkeys(':OpenInGHFile\r', 'v', true)
      end,
      mode = 'v',
      desc = 'git open lines on [r]emote',
    },
  },
}
