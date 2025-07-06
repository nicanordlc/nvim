-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal float<cr>', desc = 'NeoTree float', silent = true },
    { '|', ':Neotree reveal left<cr>', desc = 'NeoTree left', silent = true },
  },
  opts = {
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.cmd [[
          setlocal number
          setlocal relativenumber
          ]]
        end,
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['|'] = 'close_window',
          ['\\'] = 'close_window',
          [']c'] = 'next_git_modified',
          ['[c'] = 'prev_git_modified',
        },
      },
    },
  },
}
