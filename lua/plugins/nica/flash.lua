return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader><leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "fla[s]h" },
    { "<leader><leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash Tree[S]itter" },
    { "s", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "S", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
