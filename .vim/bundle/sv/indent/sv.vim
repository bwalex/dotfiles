if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" set nocindent

setlocal indentexpr=GetSVIndent()
setlocal indentkeys=0{,0},0#,!^F,o,O,e,=begin,=end,=endclass,=endprogram,=endfunction,=endtask,=endcase,=else,=endpackage,=endmodule,=endinterface,=endproperty,=endgroup,=endextends,=endclocking,=endgenerate,=endchecker,=join,=`else,=`endif,=`uvm_component_utils_end,=`uvm_object_utils_end
setlocal cinoptions=:0.5s,(0,=0.5s
" setlocal cinoptions=:0.5s,(0,=0.5s,+15

function! s:in_comment(lineno, spot)
   if type(a:spot) == type(0)
      let col = a:spot
   else
      let col = col(a:spot)
   endif
   let name = synIDattr(synID(a:lineno, col, 0), "name")
   if name =~? "comment"
      return 1
   endif
   return 0
endfunction

function! s:find_start_of_begin(lineno, linestr)
   if a:linestr =~ ')'
      let col = match(a:linestr, ')\s*begin')
      call cursor(a:lineno,col+1)
      call searchpair('(','',')','bW', "s:skip()", max([v:lnum - 30, 1]))
      return indent('.')
   endif
   return indent(a:lineno)
endfunction

function! s:create(lnum, ...)
   let o = {}
   let o.line = a:lnum
   let o.str = getline(o.line)
   if a:0
      let o.comment = s:in_comment(o.line, a:1)
   else
      let o.comment = s:in_comment(o.line, match(o.str, '\S')+1)
   endif
   return o
endfunction

function! s:pair(o, s, ...)
   let a:o.ret = 0
   let pat = '^\s*\('.join(a:000, '\|').'\)'
   if a:o.str =~ pat
      let col = match(a:o.str, '\S')
      call cursor(0,col)
      if a:0 == 1
         let line = searchpair(a:s,'',a:1,'bnW', "s:skip()")
      else
         let line = searchpair(a:s,a:1,a:2,'bnW',"s:skip()")
      endif
      " echom v:lnum "pair" a:s string(a:000) " ->" line
      let a:o.ret = line
   end
   return a:o.ret
endfunction

function! s:skip()
   let name = synIDattr(synID(line("."), col("."), 0), "name")
   if name =~? "comment"
      return 1
   elseif name =~? "string"
      return 1
   endif
   return 0
endfunction

function! GetSVIndent()
   let prev = s:create(prevnonblank(v:lnum - 1))
   let curr = s:create(v:lnum, col('.'))
   let prev2 = s:create(prevnonblank(prev.line-1))
   " echom "curr:" string(curr)
   " echom "prev:" string(prev)
   " echom "prev2:" string(prev2)

   if curr.comment
      " echom v:lnum "comment"
      return indent(prev.line)
   elseif s:pair(curr, '{', '}')
      return indent(curr.ret)
   elseif s:pair(curr, '\<begin\>', '\<end\>')
      return s:find_start_of_begin(curr.ret, curr.ret)
   elseif s:pair(curr, '\<covergroup\>', '\<endgroup\>')
      " echom v:lnum "end[cover]group".i curr.ret
      return indent(curr.ret)
   else
      for i in ["task","function","class","program","case","group","interface","clocking","sequence","property","module","extends","clocking","generate","checker"]
         if s:pair(curr, '\<'.i.'\>', '\<end'.i.'\>')
            " echom v:lnum "end".i curr.ret
            return indent(curr.ret)
         endif
      endfor
   endif

   if s:pair(curr, '^\s*fork', 'join') " have to ignore 'disable fork' statements
      return indent(curr.ret)
   elseif s:pair(curr, '`ifdef', '`else', '`endif')
      return indent(curr.ret)
   elseif s:pair(curr, '`[ou]vm_[a-z_]\+_begin.*', '`[ou]vm_[a-z_]\+_end')
      " echom v:lnum "uvm_begin, end"
      return indent(curr.ret)
   elseif prev.str =~ '\(\/\/.*\)\@<!`[ou]vm_[a-z_]\+_begin.*'
      " echom v:lnum "inside `uvm_begin block"
      return indent(prev.line) + &sw
   elseif s:pair(curr, 'randcase', 'endcase')
      return indent(curr.ret)
   elseif curr.str =~ "else"
      " else always follows an 'if' block, so either align it with the
      " previous 'if' or 'end' delimiter. Though... this may not work if
      " there is a nested if/else block...
      " let line = s:balance_if()
      let line = search('\<\%(if\|end\)\>', 'bW')
      " echom v:lnum "else ->" line
      return indent(line)
   elseif prev.comment
      " echom v:lnum "prev comment"
      return indent(prev.line)
   elseif prev.str =~ '{' && prev.str !~ '{.*}'
      " echom v:lnum "{"
      return indent(prev.line) + &sw
   elseif prev.str =~ '\<\(begin\)\>'
      " echom v:lnum "begin"
      return s:find_start_of_begin(prev.line, prev.str) + &sw
   elseif searchpair('(','',')','bnW', "s:skip()", max([v:lnum - 500, 1]))
      " We are inside a parameter list, let cindent handle it
      " echom v:lnum "inside paren" cindent(v:lnum)
      return cindent(v:lnum)
   elseif prev.str =~ '^\s*virtual interface'
      " echom v:lnum "after virtual interface variable"
      return indent(prev.line)
   elseif prev.str =~ '^\s*extends\>'
      " echom v:lnum "inside extends block"
      return indent(prev.line) + &sw
   elseif prev.str !~ '^\s*\(typedef\)' && prev.str =~ '\(\/\/.*\)\@<!\<class\>' && curr.str !~ '^\s*begin'
      " echom v:lnum "inside class block"
      return indent(prev.line) + &sw
   elseif prev.str =~ '\(\/\/.*\)\@<!pure\s\+virtual\s\+\<\(task\|function\)\>'
      " echom v:lnum "after a pure virtual task-function declaration"
      return indent(prev.line)
   elseif prev.str =~ '\(\/\/.*\)\@<!\%(virtual\)\?\s\+\<\(task\|function\)\>' && curr.str !~ '^\s*begin'
      " echom v:lnum "inside task-function block"
      return indent(prev.line) + &sw
   elseif prev.str =~ '^\s*\(\/\/.*\)\@<!\s*\<\(program\|covergroup\|case\|interface\|clocking\|sequence\|property\|module\)\>' && curr.str !~ '^\s*begin'
      " echom v:lnum "inside block"
      return indent(prev.line) + &sw
   elseif prev.str =~ '\(\/\/.*\)\@<!\<\(if\|else\|foreach\|repeat\|for\|while\|forever\|fork\)\>' && prev.str !~ ';\s*$' && prev.str !~ ';\s*//' && curr.str !~ "begin"

      " echom v:lnum "inside one-line block"
      return indent(prev.line) + &sw
   elseif prev2.str =~ '\(\/\/.*\|`\)\@<!\<\(if\|else if\|else\|for\|repeat\|while\|foreach\)\>' && prev2.str !~ '\(\<begin\>\|{\)' && prev2.str !~ ';\s*$'
      " Following a block without a begin
      " echom v:lnum "outside one-line block"
      return indent(prev2.line)
   elseif (prev.str =~ ');')
      let col = match(prev.str, ');')
      call cursor(prev.line,col+1)
      let line = searchpair('(','',')','bnW', "s:skip()", max([v:lnum - 30, 1]))
      " echom v:lnum "after paren ->" line col
      if line > 0
         let str = getline(line)
         if str =~ '^\s*\<\(function\|task\)\>'
            return indent(line) + &sw
         endif
         return indent(line)
      endif
      return indent(prev.line)
   elseif (!empty(prev.str) && prev.str !~ '\(;\|}\)' && prev.str !~ '^\s*\(end\|endfunction\|endtask\|endclass\|endmodule\|endinterface\|endcase\|endgroup\|endclocking\|endgenerate\|endextends\|endprogram\|fork\|join_any\|join\|`include\|`define\)\>' && prev.str !~ '^\s*//')
      " echom v:lnum "line continuation"
      return indent(prev.line) + &sw
   elseif prev.str =~ '^\s*`'
      " We can't tell whether the contents of a macro contains a ';', so
      " assume that it does. E.g. `uvm_component_utils()
      " echom v:lnum "macro"
      return indent(prev.line)
   elseif (prev.str =~ ';' && prev2.str !~ '\(;\|begin\|//\|end\|{\)' && prev.str !~ '}')
      " echom v:lnum "new statement after line continuation"
      return indent(prev2.line)
   endif

   " echom v:lnum "Default: autoindent:" indent(prev.line)
   return indent(prev.line) " do autoindent
   " return cindent(curr.line) " do cindent
endfunction

" g/^\s*\" echom/normal ,<
" g/^\s*echom/normal ,>

" vim: fdm=indent
