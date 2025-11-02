local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.add_snippets('lua', {
  -- class
  s(
    'cls',
    fmt(
      [[
---@class {}
---@field config Config
local {} = {{}}

---@return {}
function {}:new(config)
  local o = {{}}
  setmetatable(o, {{ __index = self }})

  o.config = config

  return o
end

return {}
      ]],
      {
        i(1, 'ClassName'),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
      }
    )
  ),

  -- module
  s(
    'mod',
    fmt(
      [[
local M = {{}}

M.{}

return M
      ]],
      {
        i(1),
      }
    )
  ),
})
