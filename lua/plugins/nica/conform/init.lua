local utils = require 'plugins.nica.conform.utils'

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format {
            async = true,
            lsp_format = utils.get_lsp_format_opt(),
          }
        end,
        mode = 'n',
        desc = '[f]ormat buffer',
      },
    },
    opts = {
      lsp_format = 'prefer',
      notify_on_error = false,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_format = utils.get_lsp_format_opt(),
        }
      end,
      formatters_by_ft = utils.get_formatters_by_ft(),
    },
  },
}
