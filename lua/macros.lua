local registers = {
  s = '¯\\_(ツ)_/¯', -- title surround
  h = 'I# A$#yyPPPPv$r#jwvf$r jf$r j^wvf$r j^v$r#',
  y = 'yypVr=Vkgc',
}

for reg, value in pairs(registers) do
  vim.fn.setreg(reg, value)
end
