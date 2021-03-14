" ********** LIGHTLINE CONFIG **********
set laststatus=2
set noshowmode  " lightline shows the mode

let g:lightline = {
      \ 'colorscheme': 'lightline_onedark_custom',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified', 'readonly' ] ],
      \   'right': [ ['lineinfo'], ['filetype'], ['cocwarning', 'cocerror'] ]
      \ },
      \ 'component_expand': {
      \  'bufferline': 'LightLineBufferline',
      \  'cocerror': 'LightLineCocError',
      \  'cocwarning': 'LightLineCocWarn',
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'NoFormat',
      \   'fileencoding': 'NoFormat',
      \   'getIcon': 'GetIcon',
      \ },
      \ 'component_type': {
      \   'bufferline': 'tabsel',
      \   'cocerror': 'error',
      \   'cocwarning': 'warning'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"},
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ]
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'filename', 'getIcon' ],
      \   'inactive': [ 'tabnum', 'filename', 'getIcon' ],
      \ }
      \ }

function! LightLineBufferline()
  call bufferline#refresh_status()
  return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
endfunction

function! LightLineCocError()
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    return 'ﰸ ' . info['error']
  endif
  return ''
endfunction

function! LightLineCocWarn() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return '' 
  endif
  if get(info, 'warning', 0)
    return ' ' . info['warning']
  endif
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! GetIcon()
  return strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : ''
endfunction

function! NoFormat()
  return ''
endfunction

" force Lightline to update on COC status change 
autocmd User CocDiagnosticChange call lightline#update()

" transparent background in statusbar
" function SetupLightlineColors() abort
"   let l:palette = lightline#palette()
" 
"   let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
"   let l:palette.inactive.middle = l:palette.normal.middle
"   let l:palette.tabline.middle = l:palette.normal.middle
" 
"   call lightline#colorscheme()
" endfunction
" 
" autocmd VimEnter * call SetupLightlineColors()
