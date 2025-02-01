return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    }

    require 'plugins.nica.diffview.autocmd'
  end,
}
