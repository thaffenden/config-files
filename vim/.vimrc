set nocompatible              " be iMproved, required
filetype off                  " required

" ********** ALL PLUGINS **********
call plug#begin('~/.vim/plugged')

" aesthetic
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'   "used in NERDTree, fzf search, lightline
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" code
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"functionality
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'

" navigational
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" *** language plug ins ***
" CSV
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" Python
Plug 'psf/black', { 'for': 'python' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Snippets
Plug 'SirVer/ultisnips'

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

Plug 'cespare/vim-toml', { 'for': 'toml' }

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

" CocLanguageServers
Plug 'fannheyward/coc-markdownlint', { 'for': 'markdown' }
Plug 'fannheyward/coc-pyright', { 'for': 'python' }
Plug 'neoclide/coc-json', { 'for': 'json' }
Plug 'neoclide/coc-python', { 'for': 'python' }
" Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-yaml', { 'for': 'yaml' }
Plug 'josa42/coc-docker'

" File management
Plug 'qpkorr/vim-renamer'
Plug 'AndrewRadev/id3.vim'

call plug#end()

" ********** STANDARD VIM SETTINGS **********
set autoindent 			                      "auto indent new lines
set backspace=indent,eol,start 	          "use backspace character like proper delete
set backupdir=~/.vim/backup//             "back up directory
set directory=~/.vim/swap//               "swap directory
set encoding=utf-8
set expandtab 			                      "expand tab character to spaces
set number 			                          "display line numbers in file
set relativenumber 		                    "make line numbers relative
set spell 			                          "enable spell check by default
set spellfile=~/.vim/spell/en.utf-8.add   "spell file location for custom terms
set spelllang=en 		                      "set spelling to English
set showmatch 			                      "show matching brackets
set shiftwidth=2 		                      "tabs are 2 spaces
set tabstop=2
set undodir=~/.vim/undo//                 "undo directory
set timeout timeoutlen=1000 ttimeoutlen=0

" ********** COC CONFIG **********
source ~/git/config-files/vim/coc-settings.vim

" ********** COLOUR SCHEME **********
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on
colorscheme onedark

if (has("termguicolors"))
 set termguicolors
endif

" ********** FZF search with preview **********
nnoremap <C-p> :Files<CR>

" ripgrep
if executable('rg')

  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)  
  
  " Overriding fzf.vim's default :Files command.
  " Pass zero or one args to Files command (which are then passed to Fzf_dev). Support file path completion too.
  command! -nargs=? -complete=file Files call Fzf_dev(<q-args>)
endif

" Files + devicons
function! Fzf_dev(qargs)
  let l:fzf_files_options = '--preview "bat --theme="TwoDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'" --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all'

  function! s:files(dir)
    let l:cmd = $FZF_DEFAULT_COMMAND
    if a:dir != ''
      let l:cmd .= ' ' . shellescape(a:dir)
    endif
    let l:files = split(system(l:cmd), '\n')
    return s:prepend_icon(l:files)
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

  call fzf#run({
        \ 'source': <sid>files(a:qargs),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction


" ********** GO CONFIG **********
let g:go_fmt_command = 'goimports'
let g:go_list_type = 'quickfix'
let g:go_highlight_functions = 1
let g:go_gopls_staticcheck = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_command='golangci-lint'
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'goconst', 'gosec', 'lll', 'unparam', 'deadcode']
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'goconst', 'gosec', 'lll', 'unparam', 'deadcode']


" ********** LIGHTLINE CONFIG **********
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'onedark',
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
      \ },
      \ 'component_type': {
      \   'bufferline': 'tabsel',
      \   'cocerror': 'error',
      \   'cocwarning': 'warning'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"},
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

function! NoFormat()
  return ''
endfunction

" force Lightline to update on COC status change 
autocmd User CocDiagnosticChange call lightline#update()

" ********** NERDTREE CONFIG **********  
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" search for word under cursor
" nnoremap <silent><leader>f :Rg -q <C-R>=expand("<cword>")<CR><CR>

function! s:GetVisualSelection()
    if mode()=="v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
        \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
            return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" search for visually selected item
vnoremap <silent><leader>f <Esc>:Rg <C-R>=<SID>GetVisualSelection()<CR><CR>
