" Vim indent file
" Language: b-html
" Maintainer: YuZakuro <zakuro@yuzakuro.me>
" Last Change: 2015 Aug 13

if exists("b:did_indent")
  finish
endif

unlet! b:did_indent
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetBhtmlIndent()
setlocal indentkeys=!^F,o,O,e,0<,0@

if exists("*GetBhtmlIndent")
  finish
endif

function! GetBhtmlIndent()
  let lnum = prevnonblank(v:lnum-1)
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let line = substitute(line,'^\s\+','','')
  let indent = indent(lnum)
  let increase = indent + &sw

  if line =~'^<'
    return increase
  else
    return indent
  endif
endfunction
