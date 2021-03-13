"Files mappings
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buf<CR>
nnoremap <leader>g <Esc>:GFiles?<CR>

let g:fzf_action={
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vertical split',
  \ 'ctrl-t': 'tabe' }

let g:fzf_layout= { 'down': '40%' }

" ripgrep
if executable('rg')

  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)  
  
  " Overriding fzf.vim's default :Files command.
  " Pass zero or one args to Files command (which are then passed to Fzf_dev). Support file path completion too.
  command! -nargs=? -complete=file Files call Fzf_files(<q-args>)
  " command! -nargs=? -complete=file Buf call Fzf_buf(<q-args>)
endif

" ********** FZF search with preview **********
let s:default_fzf_options = '--preview "bat --theme="TwoDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'" --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all'

function! s:edit_file(lines)
  if len(a:lines) < 2 | return | endif

  let l:cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  
  for l:item in a:lines[1:]
    let l:pos = stridx(l:item, ' ')
    let l:file_path = l:item[pos+1:-1]
    execute 'silent '. l:cmd . ' ' . l:file_path
  endfor
endfunction

function! s:prepend_icon(candidates)
  let l:result = []
  for l:candidate in a:candidates
    let l:filename = fnamemodify(l:candidate, ':p:t')
    let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
    call add(l:result, printf('%s %s', l:icon, l:candidate))
  endfor

  return l:result
endfunction

" Files + devicons
function! Fzf_files(qargs)

  function! s:files(dir)
    let l:cmd = $FZF_DEFAULT_COMMAND
    if a:dir != ''
      let l:cmd .= ' ' . shellescape(a:dir)
    endif
    let l:files = split(system(l:cmd), '\n')
    return s:prepend_icon(l:files)
  endfunction
  
  call fzf#run(fzf#wrap({
        \ 'options': '-m ' . s:default_fzf_options,
        \ 'sink*': function('s:edit_file'),
        \ 'source': <sid>files(a:qargs) }))
endfunction

function! Fzf_buf(qargs) 
  function! s:buf(dir)
    redir => ls
    silent ls
    redir END
    let l:files = split(ls, '\n')
    return s:prepend_icon(l:files)
  endfunction
  
  call fzf#run(fzf#wrap({
        \ 'options': '-m ' . s:default_fzf_options,
        \ 'sink*': function('s:edit_file'),
        \ 'source': <sid>buf(a:qargs) }))

endfunction

" customise status line when fzf is active
if has('nvim') && !exists('g:fzf_layout')
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

