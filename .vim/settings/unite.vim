""" let g:unite_source_history_yank_enable = 1
""" let g:unite_source_yank_history_save_clipboard = 1
""" 
""" " Start in insert mode
""" let g:unite_enable_start_insert = 1
""" 
""" " Set unite's grep to ag
""" let g:unite_source_grep_command = 'ag'
""" 
""" autocmd BufEnter *
""" \   if empty(&buftype)
""" \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
""" \|  endif
" Define mappings
