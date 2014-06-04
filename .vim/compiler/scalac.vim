" Compiler: scala compiler (scalac)
" Author: Michael Schmitz <michael@schmitztech.com>
" Last Change: 10/27/2011

if exists("current_compiler")
  finish
endif
let current_compiler = "scalac"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=scalac\ -cp\ .\ %
CompilerSet errorformat=%E%f:%l:\ error:\ %m,%Z%p^,%-C%.%#,
    \%-G%.%#
