local cmp = require 'cmp'
local ls = require 'luasnip'
--
return {
  ['<C-l>'] = cmp.mapping(function()
    if ls.expand_or_locally_jumpable() then
      ls.expand_or_jump()
    end
  end, { 'i', 's' }),

  ['<C-h>'] = cmp.mapping(function()
    if ls.locally_jumpable(-1) then
      ls.jump(-1)
    end
  end, { 'i', 's' }),

  ['<C-v>'] = cmp.mapping(function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end),

  ['<C-b>'] = cmp.mapping(function()
    if ls.choice_active() then
      ls.change_choice(-1)
    end
  end),
}

-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
