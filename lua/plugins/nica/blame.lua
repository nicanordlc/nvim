return {
  'FabijanZulj/blame.nvim',
  cmd = 'BlameToggle',
  keys = {
    {
      '<leader>gb',
      '<cmd>BlameToggle virtual<cr>',
      mode = 'n',
      desc = 'git [b]lame',
    },
  },
  opts = {},
}
