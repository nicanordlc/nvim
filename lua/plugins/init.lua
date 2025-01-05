require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'plugins.kickstart.gitsigns',
  require 'plugins.kickstart.which-key',
  require 'plugins.kickstart.telescope',
  require 'plugins.kickstart.lspconfig',
  require 'plugins.kickstart.conform',
  require 'plugins.kickstart.cmp',
  require 'plugins.kickstart.tokyonight',
  require 'plugins.kickstart.todo-comments',
  require 'plugins.kickstart.mini',
  require 'plugins.kickstart.treesitter',

  -- TODO: check these other plugins
  -- require 'plugins.others.debug',
  -- require 'plugins.others.indent_line',
  -- require 'plugins.others.lint',
  -- require 'plugins.others.autopairs',
  -- require 'plugins.others.neo-tree',

  { import = 'plugins.nica' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
