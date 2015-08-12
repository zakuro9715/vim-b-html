" Vim syntax file
" Language:     b-htmL
" Maintainer:   YuZakuro <zakuro@yuzakuro.me>
" Last Change:  2015 Aug 13

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'bhtml'
endif


syn include @htmlJavaScript syntax/javascript.vim
syn include @htmlCss syntax/css.vim
syn include @html syntax/html.vim


let b:current_syntax = 'bhtml'


syn region bhtmlComment start=/<!/ end=/$/

syn region bhtmlEmptyElement start=/<\// end=/$/ 
syn region bhtmlElement      start=/<[^!\/]/ end=/$/
syn region bhtmlAttr         start='@' end=/$/ contains=bhtmlAttrName,bhtmlAttrValue
syn match  bhtmlAttrName  contained /@.\{-} /

syn region bhtmlText        keepend start=/^\s*>/ end=/$/ contains=bhtmlTextInner
syn region bhtmlNewLineText keepend start=/^\s*|/ end=/$/ contains=bhtmlTextInner
syn region bhtmlTextInner contained start=/^\s*/ms=e+2 end=/$/ contains=@html

hi def link bhtmlComment Comment

hi def link bhtmlEmptyElement bhtmlElement
hi def link bhtmlElement      Statement
hi def link bhtmlAttrName     Type
hi def link bhtmlAttr         String

hi def link bhtmlNewLineText bhtmlText
hi def link bhtmlText        String
hi def link bhtmlTextInner   String
