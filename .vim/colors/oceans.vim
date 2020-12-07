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

" peripheral if
" FIXME why won't these link?
hi Visual        term=reverse       cterm=none ctermfg=none ctermbg=234
hi VisualNOS     term=reverse       cterm=none ctermfg=none ctermbg=234
hi Cursor        term=none          cterm=none ctermbg=237 ctermfg=none
hi CursorIM      term=reverse       cterm=none ctermbg=237 ctermfg=none
hi CursorColumn  term=none          cterm=bold ctermbg=233 ctermfg=none
hi SignColumn                      	ctermfg=168 ctermbg=none
hi ColorColumn   term=none          ctermfg=70 ctermbg=none
hi CursorLine    term=none          cterm=none ctermbg=233 ctermfg=none
hi CursorLineNr  term=none          cterm=none ctermfg=34 ctermbg=none
hi LineNr        term=bold         	cterm=none ctermfg=239 ctermbg=none
hi StatusLine    term=reverse      	cterm=none ctermfg=34 ctermbg=none
hi StatusLineNC  term=reverse      	cterm=none ctermfg=239 ctermbg=none
hi TabLine       term=none          cterm=none ctermbg=none ctermfg=none
hi TabLineFill   term=none          cterm=none ctermbg=none
hi TabLineSel    term=none      	ctermfg=34 ctermbg=none
hi VertSplit     term=none      	ctermfg=232 ctermbg=235

" menus
hi WildMenu     term=reverse      	ctermfg=237 ctermbg=none
hi Pmenu         term=reverse      	ctermfg=237 ctermbg=none
hi PmenuSel      term=bold         	cterm=none ctermfg=28  ctermbg=234
hi PmenuSbar     term=reverse      	ctermfg=237 ctermbg=none
hi PmenuThumb    term=reverse      	ctermfg=gray ctermbg=none

" characters
hi MatchParen    term=bold          ctermbg=none ctermfg=220
hi Delimiter     term=bold         	ctermfg=35 ctermbg=none
hi SpecialChar   term=bold         	ctermfg=64 ctermbg=none
hi Special       term=bold         	ctermfg=34 ctermbg=none

" values
hi Constant      term=underline    	ctermfg=34 ctermbg=none
hi Character     term=none          ctermfg=35 ctermbg=none
hi Number        term=none    	    ctermfg=36 ctermbg=none
hi link Float Number

" keywords
hi Operator      term=none          ctermfg=72 ctermbg=none
hi Question      term=none     	    ctermfg=37 ctermbg=none
hi Directory     term=underline    	ctermfg=33 ctermbg=none
hi Function      term=standout     	ctermfg=32 ctermbg=none
hi link Repeat         Question
hi link Conditional    Repeat
hi Statement     term=standout     	ctermfg=66 ctermbg=none
hi link Exception     Statement
hi link Keyword       Statement
hi link Label         Statement
hi PreProc       term=standout     	ctermfg=34 ctermbg=none
hi link Define         PreProc
hi link Include        PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc

" messages
hi ModeMsg       term=bold          ctermfg=22 ctermbg=none
hi MoreMsg       term=bold          ctermfg=28 ctermbg=none
hi Debug         term=bold         	ctermfg=208 ctermbg=none
hi WarningMsg    term=none      	ctermfg=208 ctermbg=none
hi Error         term=reverse,bold 	ctermfg=202 ctermbg=none
hi ErrorMsg      term=reverse,bold 	ctermfg=202 ctermbg=none

" annotations
hi Ignore                          	ctermfg=237 ctermbg=none
hi Identifier    term=underline    	ctermfg=30 ctermbg=none
hi Todo          term=none          ctermfg=28 ctermbg=none
hi Comment       term=italic        ctermfg=239 ctermbg=none
hi SpecialComment       term=italic    ctermfg=242 ctermbg=none
hi Folded        term=italic        ctermfg=239 ctermbg=none
hi FoldColumn    term=italic        ctermfg=239 ctermbg=none
hi Title         term=reverse      	ctermfg=61 ctermbg=none
hi Search        term=reverse      	cterm=none ctermfg=208 ctermbg=none
hi IncSearch     term=reverse       cterm=none ctermfg=208 ctermbg=none
hi Tag           term=bold         	ctermfg=79 ctermbg=none

" types
hi StorageClass  term=standout     	ctermfg=31 ctermbg=none
hi String        term=none    	    ctermfg=26 ctermbg=none
hi Type          term=standout     	ctermfg=33 ctermbg=none
hi Typedef       term=standout     	ctermfg=32 ctermbg=none
hi Boolean      term=none    	ctermfg=30 ctermbg=none
hi Structure     term=standout     	ctermfg=30 ctermbg=none

hi NonText                         	ctermfg=235 ctermbg=none
hi Normal                          	ctermfg=none ctermbg=none
hi SpecialKey    term=bold         	ctermfg=37 ctermbg=none

" spelling
hi SpellBad      term=reverse        cterm=underline	ctermfg=220 ctermbg=none
hi SpellCap      term=reverse        cterm=underline	ctermfg=214 ctermbg=none
hi SpellLocal    term=reverse        cterm=underline	ctermfg=blue ctermbg=none
hi SpellRare     term=reverse        cterm=underline	ctermfg=70 ctermbg=none

" diffs
hi DiffAdd                           ctermfg=70 ctermbg=none
hi DiffChange                        ctermfg=220 ctermbg=none
hi DiffDelete                        ctermfg=red ctermbg=none
hi DiffText                          ctermfg=76 ctermbg=none
hi link GitGutterAdd DiffAdd
hi link GitGutterChange DiffChange
hi link GitGutterDelete DiffDelete
hi link GitGutterChangeDelete DiffChange

" html
hi htmlItalic               term=italic                 cterm=italic ctermfg=233 ctermbg=white
hi htmlBoldItalic           term=bold,italic            cterm=bold,italic ctermfg=233 ctermbg=white
hi htmlBoldUnderlineItalic  term=bold,underline,italic  cterm=bold,underline,italic ctermfg=233 ctermbg=white
hi htmlUnderlineItalic      term=underline,italic       cterm=underline,italic ctermfg=233 ctermbg=white
