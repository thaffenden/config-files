" plugins
execute pathogen#infect()
call pathogen#helptags()

set shiftwidth=4
set number
set tabstop=4
set expandtab
set autoindent

syntax on


" lightline (bottom bar) config
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileFormat',
      \ },
      \ }


" enable NERDTree at start
autocmd vimenter * NERDTree

" disable it when you close the last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle it with ctrl + n
map <C-n> :NERDTreeToggle<CR>


set encoding=utf-8
set guifont=Space\ Mono\ Nerd\ Font\ Complete\ Mono\ 12

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

