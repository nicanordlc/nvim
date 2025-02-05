return {
  'catgoose/coderunner.nvim',
  keys = {
    {
      '<leader>cc',
      function()
        require('coderunner').run { split = 'horizontal' }
      end,
      desc = 'Run [c]ode in a split terminal',
    },
    {
      '<leader>cv',
      function()
        require('coderunner').run { split = 'vertical' }
      end,
      desc = 'Run code in a [v]ertical split terminal',
    },
  },
  opts = {
    split = 'vertical',
    scale = 0.25,
    langs = {
      lua = {
        { 'luajit', '[#file]' },
      },
      sh = {
        { 'bash', '[#file]' },
      },
      html = {
        { 'python3', '-m', 'http.server', '11080' },
      },
    },
  },
}
