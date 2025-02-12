local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local c = ls.choice_node

local add_snippets = require('snippets.utils').add_snippets

add_snippets({ 'javascript', 'typescript', 'typescriptreact' }, {
  -- normal log
  s(
    'logn',
    fmt([[console.log('!@', {})]], {
      i(1),
    })
  ),

  -- pretty log
  s(
    'logp',
    fmt(
      [[
      console.log(
        '%c{{0}}'.replace('{{0}}', `!@${{{}}}`),
        'background-color: {}; color: white; font-size: 23px;',
      )
      ]],
      {
        i(1),
        c(2, {
          t 'black',
          t 'green',
        }),
      }
    )
  ),
})
