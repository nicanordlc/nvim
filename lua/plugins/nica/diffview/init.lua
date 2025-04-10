return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      view = {
        merge_tool = {
          layout = 'diff1_plain',
        },
      },
    }

    require 'plugins.nica.diffview.autocmd'
  end,
}
