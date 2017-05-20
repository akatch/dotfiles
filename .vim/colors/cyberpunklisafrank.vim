"
" ~/.vim/colors/cyberpunklisafrank.vim
"

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "cyberpunklisafrank"
highlight Cursor        term=none          	ctermfg=76 ctermbg=blue
highlight CursorIM      term=reverse       	ctermfg=237 ctermbg=70
highlight CursorColumn  term=none           cterm=bold ctermbg=233 ctermfg=none
highlight CursorLine    term=none           cterm=bold ctermbg=233 ctermfg=none
highlight CursorLineNr  term=none           ctermfg=76 ctermbg=none
highlight Comment       term=italic         ctermfg=239 ctermbg=none
highlight Constant      term=underline    	ctermfg=blue ctermbg=none
highlight Debug         term=bold         	ctermfg=red ctermbg=none

highlight DiffAdd                           ctermfg=70 ctermbg=none
highlight DiffChange                        ctermfg=220 ctermbg=none
highlight DiffDelete                        ctermfg=red ctermbg=none
highlight DiffText                          ctermfg=76 ctermbg=none

highlight Directory     term=underline    	ctermfg=76 ctermbg=none
highlight Error         term=reverse,bold 	ctermfg=darkred ctermbg=none
highlight ErrorMsg      term=reverse,bold 	ctermfg=darkred ctermbg=none
highlight Folded                          	ctermfg=70 ctermbg=none
highlight FoldColumn                      	ctermfg=70 ctermbg=none
highlight Function      term=standout     	ctermfg=70 ctermbg=none
highlight Identifier    term=underline    	ctermfg=30 ctermbg=none
highlight Ignore                          	ctermfg=76 ctermbg=none
highlight IncSearch     term=reverse      	ctermfg=237 ctermbg=70
highlight LineNr        term=bold         	ctermfg=239 ctermbg=none
highlight MatchParen    term=bold           ctermbg=76
highlight ModeMsg       term=bold           cterm=bold
highlight MoreMsg       term=bold           cterm=bold
highlight NonText                         	ctermfg=235 ctermbg=none
highlight Normal                          	ctermfg=none ctermbg=none
highlight Operator      term=none           ctermfg=76 ctermbg=none
highlight Pmenu         term=reverse      	ctermfg=237 ctermbg=none
highlight PmenuSel      term=bold         	ctermfg=237  ctermbg=gray
highlight PmenuSbar     term=reverse      	ctermfg=237 ctermbg=none
highlight PmenuThumb    term=reverse      	ctermfg=gray ctermbg=none
highlight PreProc       term=standout     	ctermfg=70 ctermbg=none
highlight Question      term=none     	    ctermfg=red ctermbg=none
highlight Search        term=reverse      	ctermfg=237 ctermbg=70
highlight SignColumn                      	ctermfg=70 ctermbg=none
highlight Special       term=bold         	ctermfg=76 ctermbg=none
highlight SpecialKey    term=bold         	ctermfg=76 ctermbg=none
highlight SpellBad      term=reverse        cterm=underline	ctermfg=220 ctermbg=none
highlight SpellCap      term=reverse        cterm=underline	ctermfg=214 ctermbg=none
highlight SpellLocal    term=reverse        cterm=underline	ctermfg=blue ctermbg=none
highlight SpellRare     term=reverse        cterm=underline	ctermfg=70 ctermbg=none
highlight Statement     term=standout     	ctermfg=darkred ctermbg=none
highlight StatusLine    term=reverse      	ctermfg=233 ctermbg=70
highlight StatusLineNC  term=reverse      	ctermfg=233 ctermbg=darkgrey
highlight TabLine       term=none           cterm=none ctermbg=none ctermfg=darkgrey
highlight TabLineFill   term=none           cterm=bold ctermbg=none
highlight TabLineSel    term=none      	    ctermfg=76 ctermbg=none
highlight Title         term=reverse      	ctermfg=76 ctermbg=237
highlight Todo          term=none      	    ctermfg=70 ctermbg=none
highlight Type          term=standout     	ctermfg=76 ctermbg=none
highlight Visual        term=reverse        cterm=reverse ctermfg=70 ctermbg=none
highlight VisualNOS     term=reverse,bold   cterm=reverse ctermbg=70
highlight VertSplit     term=none      	    ctermfg=237 ctermbg=none
highlight User1         term=standout       cterm=bold ctermbg=70 	ctermfg=red
highlight WarningMsg    term=none      	    ctermfg=214 ctermbg=none


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
