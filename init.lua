-- patches
vim.hl = vim.highlight

--  NOTE: Leader must be declared before plugins init
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Nerd font usage
vim.g.have_nerd_font = true

require 'options'
require 'options.filetypes.javascript'
require 'autocmd'
require 'usercommands'
require 'keymaps'
require 'lazy-bootstrap'
require 'plugins'
require 'snippets.init'
require 'textobjects'

-- vim: ts=2 sts=2 sw=2 et
