"
" ~/.vim/colors/chillaxedgreen.vim
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
" then load it with :colorscheme chillaxedgreen
"

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "chillaxedgreen"
highlight Cursor        term=none          	ctermfg=118 ctermbg=blue
highlight CursorIM      term=reverse       	ctermfg=237 ctermbg=70
highlight CursorColumn  term=none           ctermbg=darkred
highlight CursorLine    term=none           cterm=bold ctermbg=237 ctermfg=none
highlight CursorLineNr  term=none           ctermbg=NONE ctermfg=118
highlight Comment       term=italic         ctermfg=darkcyan ctermbg=NONE
highlight Constant      term=underline    	ctermfg=blue
highlight Debug         term=bold         	ctermfg=red ctermbg=NONE

highlight DiffAdd                           ctermfg=70 ctermbg=NONE
highlight DiffChange                        ctermfg=yellow ctermbg=NONE
highlight DiffDelete                        ctermfg=red ctermbg=NONE
highlight DiffText                          ctermfg=118 ctermbg=NONE

highlight Directory     term=underline    	ctermfg=118 ctermbg=NONE
highlight Error         term=reverse,bold 	ctermfg=237 ctermbg=red
highlight ErrorMsg      term=reverse,bold 	ctermfg=white ctermbg=red
highlight Folded                          	ctermfg=70 ctermbg=NONE
highlight FoldColumn                      	ctermfg=70 ctermbg=NONE
highlight Function      term=standout     	ctermfg=70
highlight Identifier    term=underline    	ctermfg=darkcyan
highlight Ignore                          	ctermfg=lightgreen
highlight IncSearch     term=reverse      	ctermfg=237 ctermbg=70
highlight LineNr        term=bold         	ctermfg=darkgray
highlight MatchParen    term=bold           ctermbg=118
highlight ModeMsg       term=bold           cterm=bold
highlight MoreMsg       term=bold           cterm=bold
highlight NonText                         	ctermfg=darkgray
highlight Normal                          	ctermfg=gray ctermbg=NONE
highlight Operator      term=none           ctermbg=none 	ctermfg=118
highlight Pmenu         term=reverse      	ctermfg=237 ctermbg=118
highlight PmenuSel      term=bold         	ctermfg=237  ctermbg=gray
highlight PmenuSbar     term=reverse      	ctermfg=237 ctermbg=118
highlight PmenuThumb    term=reverse      	ctermfg=gray ctermbg=NONE
highlight PreProc       term=standout     	ctermfg=70
highlight Question      term=none     	    ctermfg=red
highlight Search        term=reverse      	ctermfg=237 ctermbg=70
highlight SignColumn                      	ctermfg=70 ctermbg=NONE
highlight Special       term=bold         	ctermfg=118
highlight SpecialKey    term=bold         	ctermfg=118
highlight SpellBad      term=reverse        cterm=underline 	ctermfg=red ctermbg=NONE
highlight SpellCap      term=reverse        cterm=underline 	ctermfg=yellow ctermbg=NONE
highlight SpellLocal    term=reverse        cterm=underline 	ctermfg=blue ctermbg=NONE
highlight SpellRare     term=reverse        cterm=underline 	ctermfg=70 ctermbg=NONE
highlight Statement     term=standout     	ctermfg=darkred
highlight StatusLine    term=reverse      	ctermfg=70 ctermbg=NONE
highlight StatusLineNC  term=reverse      	ctermfg=70 ctermbg=blue
highlight TabLine       term=none           cterm=reverse 	ctermfg=237 ctermbg=darkgray
highlight TabLineFill   term=reverse        cterm=bold ctermbg=NONE 	ctermfg=darkgray
highlight TabLineSel    term=none      	    ctermfg=70 ctermbg=NONE
highlight Title         term=reverse      	ctermfg=118 ctermbg=237
highlight Todo          term=none      	    ctermfg=70 ctermbg=NONE
highlight Type          term=standout     	ctermfg=118
highlight Visual        term=reverse        cterm=reverse 	ctermfg=70
highlight VisualNOS     term=reverse,bold   cterm=reverse ctermbg=70
highlight VertSplit     term=none      	    ctermfg=237
highlight User1         term=standout       cterm=bold ctermbg=70 	ctermfg=red
highlight WarningMsg    term=reverse      	ctermfg=237 ctermbg=yellow


" Common groups that link to other highlight definitions.

highlight link Character      Constant
highlight link Number         Constant
highlight link Boolean        Constant
highlight link String         Constant

highlight link Float          Number

highlight link Define         PreProc
highlight link Include        PreProc
highlight link Macro          PreProc
highlight link PreCondit      PreProc

highlight link Repeat         Question

highlight link Conditional    Repeat

highlight link Delimiter      Special
highlight link SpecialChar    Special
highlight link SpecialComment Special
highlight link Tag            Special

highlight link Exception     Statement
highlight link Keyword       Statement
highlight link Label         Statement

highlight link StorageClass  Type
highlight link Structure     Type
highlight link Typedef       Type

highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete DiffChange
