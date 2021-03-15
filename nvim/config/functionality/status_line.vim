function! InactiveLine()
    return luaeval("require('status-line').inactive_line()")
endfunction

function! ActiveLine()
    return luaeval("require('status-line').active_line()")
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END


function! TabLine()
    return luaeval("require('status-line').tab_line()")
endfunction

set tabline=%!TabLine()
