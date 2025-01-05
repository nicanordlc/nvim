--  NOTE: Leader must be declared before plugins init
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Nerd font usage
vim.g.have_nerd_font = true

require 'options'
require 'autocmd'
require 'keymaps'
require 'lazy-bootstrap'
require 'plugins'

-- vim: ts=2 sts=2 sw=2 et
