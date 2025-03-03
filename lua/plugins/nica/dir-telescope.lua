return {
  'princejoogie/dir-telescope.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  cmd = { 'GrepInDirectory', 'FileInDirectory' },
  opts = {
    hidden = true,
    no_ignore = false,
    show_preview = true,
    follow_symlinks = true,
  },
}
