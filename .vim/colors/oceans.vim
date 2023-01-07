" ~/.vim/colors/oceans.vim
" A modified version of the relaxedgreen colorscheme by Dave Vehrs
"
" Original Copyright:
" 2002,2003,2004,2005,2006,2007 Dave Vehrs
" This script is free software; you can redistribute it and/or
" modify it under the terms of the GNU General Public License as
" published by the Free Software Foundation; either version 2 of
" the License, or (at your option) any later version.
"
" Usage:
" Place this file in the users colors directory (~/.vim/colors) or
" in the shared colors directory (/usr/shared/vim/vim<version>/colors/),
" then load it with :colorscheme oceans
"

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "oceans"

" core UI
" Visual and VisualNOS won't link, not sure why
hi Visual        ctermbg=234
hi VisualNOS     ctermbg=234
hi Cursor        ctermbg=237
hi CursorIM      ctermfg=none ctermbg=237 cterm=none
hi CursorColumn  ctermfg=none ctermbg=233 cterm=bold
hi SignColumn    ctermfg=168 ctermbg=none
hi ColorColumn   ctermfg=70
hi CursorLine    ctermbg=233 cterm=none
hi CursorLineNr  ctermfg=34 cterm=none
hi LineNr        ctermfg=239
hi StatusLine    ctermfg=34 ctermbg=none cterm=none
hi StatusLineNC  ctermfg=239 ctermbg=none cterm=none
hi TabLine       ctermfg=239 ctermbg=none cterm=none
hi TabLineFill   ctermbg=none cterm=none
hi TabLineSel    ctermfg=34 ctermbg=none cterm=none
hi VertSplit     ctermfg=232 ctermbg=235

" menus
hi WildMenu      ctermfg=237 ctermbg=none
hi Pmenu         ctermfg=237 ctermbg=none
hi PmenuSel      ctermfg=28 ctermbg=234 cterm=none
hi PmenuSbar     ctermfg=237 ctermbg=none
hi PmenuThumb    ctermfg=gray ctermbg=none

" characters
hi MatchParen    ctermfg=220 ctermbg=none
hi Delimiter     ctermfg=35 ctermbg=none
hi SpecialChar   ctermfg=64 ctermbg=none
hi Special       ctermfg=34 ctermbg=none

" values
hi Constant      ctermfg=40
hi Character     ctermfg=35
hi Number        ctermfg=36
hi link Float Number

" keywords
hi Operator      ctermfg=72 ctermbg=none
hi Question      ctermfg=37 ctermbg=none
hi Directory     ctermfg=33 ctermbg=none
hi Function      ctermfg=32 ctermbg=none
hi Statement     ctermfg=66 ctermbg=none
hi PreProc       ctermfg=34 ctermbg=none
hi link Repeat Question
hi link Conditional Repeat
hi link Exception Statement
hi link Keyword Statement
hi link Label Statement
hi link Define PreProc
hi link Include PreProc
hi link Macro PreProc
hi link PreCondit PreProc

" messages
hi ModeMsg       ctermfg=22 ctermbg=none
hi MoreMsg       ctermfg=28 ctermbg=none
hi Debug         ctermfg=208 ctermbg=none
hi WarningMsg    ctermfg=208 ctermbg=none
hi Error         ctermfg=202 ctermbg=none
hi ErrorMsg      ctermfg=202 ctermbg=none

" annotations
hi Ignore           ctermfg=237 ctermbg=none
hi Identifier       ctermfg=30 ctermbg=none
hi Todo             ctermfg=28 ctermbg=none
hi Comment          ctermfg=239 ctermbg=none
hi SpecialComment   ctermfg=242 ctermbg=none
hi Folded           ctermfg=239 ctermbg=none
hi FoldColumn       ctermfg=239 ctermbg=none
hi Title           	ctermfg=28 ctermbg=none
hi Search         	cterm=none ctermfg=208 ctermbg=none
hi IncSearch        cterm=none ctermfg=208 ctermbg=none
hi Tag           	ctermfg=79 ctermbg=none

" types
hi StorageClass  ctermfg=31 ctermbg=none
hi String        ctermfg=26 ctermbg=none
hi Type          ctermfg=29 ctermbg=none
hi Typedef       ctermfg=32 ctermbg=none
hi Boolean       ctermfg=30 ctermbg=none
hi Structure     ctermfg=30 ctermbg=none

hi NonText       ctermfg=235 ctermbg=none
hi Normal        ctermfg=none ctermbg=none
hi SpecialKey    ctermfg=37 ctermbg=none

" spelling
hi SpellBad      ctermfg=220 ctermbg=none cterm=underline
hi SpellCap      ctermfg=214 ctermbg=none cterm=underline
hi SpellLocal    ctermfg=blue ctermbg=none cterm=underline
hi SpellRare   	 ctermfg=70 ctermbg=none  cterm=underline

" diffs
hi DiffAdd       ctermfg=70 ctermbg=none
hi DiffChange    ctermfg=220 ctermbg=none
hi DiffDelete    ctermfg=red ctermbg=none
hi DiffText      ctermfg=76 ctermbg=none
hi link GitGutterAdd DiffAdd
hi link GitGutterChange DiffChange
hi link GitGutterDelete DiffDelete
hi link GitGutterChangeDelete DiffChange

" html
hi htmlItalic               cterm=none ctermfg=white ctermbg=none
hi htmlBoldItalic           cterm=bold ctermfg=white ctermbg=none
hi htmlBoldUnderlineItalic  cterm=bold,underline ctermfg=white ctermbg=none
hi htmlUnderlineItalic      cterm=underline ctermfg=white ctermbg=none
