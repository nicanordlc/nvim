return {
  'christoomey/vim-tmux-runner',
  keys = {
    {
      '<localleader>r',
      ':wa | VtrSendFile!<cr>',
      mode = 'n',
      desc = '[vtr] Send file to runner',
    },
    {
      'tr',
      ':wa | VtrSendCommandToRunner!<cr>',
      mode = 'n',
      desc = '[vtr] Send command to runner',
    },
    {
      'tR',
      ':wa | VtrFlushCommand<cr>:VtrSendCommandToRunner!<cr>',
      mode = 'n',
      desc = '[vtr] Clear and send commant to runner',
    },
    {
      'tf',
      '<cmd>VtrFocusRunner<cr>',
      mode = 'n',
      desc = '[vtr] Focus runner',
    },
    {
      'tk',
      '<cmd>VtrKillRunner<cr>',
      mode = 'n',
      desc = '[vtr] Kill runner',
    },
    {
      'ta',
      function()
        local pane = vim.fn.system { 'tmux', 'display', '-pF', '#P' }
        vim.cmd(':VtrAttachToPane ' .. pane + 1, 'n', true)
      end,
      desc = '[vtr] Attach to next pane',
      mode = 'n',
    },
    {
      'tA',
      ':VtrAttachToPane<space>',
      mode = 'n',
      desc = '[vtr], Attach to pane',
    },
  },
}
