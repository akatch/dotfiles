" Vim syntax file
" Language:	todo.txt
" Maintainer: Allyson Bowles <github.com/akatch>
" URL:

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "todotxt"

syn keyword todoDue due rec
syn match todoPriorityA '(A)'
syn match todoPriorityB '(B)'
syn match todoPriorityC '(C)'
syn match todoPriorityOther '([D-Z])'
syn match todoDate '\(\d\+-\d\+-\d\+\)'
syn match todoCompleted '^x .*$'
syn match todoTag '+\S\+'
syn match todoContext '@\S\+'

hi def link todoCompleted Comment
hi def link todoPriorityA diffDelete
hi def link todoPriorityB diffChange
hi def link todoPriorityC diffNew
hi def link todoTag Type
hi def link todoContext Title
