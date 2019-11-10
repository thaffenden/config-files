set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" functionality
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" aesthetic
Plugin 'joshdick/onedark.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" language specific
" general lint/code quality
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'w0rp/ale'
Plugin 'maximbaz/lightline-ale'

" snippets
Plugin 'SirVer/ultisnips'

" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Go
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" GraphQL
" Plugin 'jparise/vim-graphql'

" Markdown
" Plugin 'shime/vim-livedown'

" Python
Plugin 'psf/black'

" Terraform
Plugin 'hashivim/vim-terraform'

" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 

" fix backspace
set backspace=indent,eol,start

" show line numbers
set number relativenumber

" enable spell checking
set spelllang=en
set spell

" configure tab settings
set shiftwidth=2
set tabstop=2
set autoindent
set expandtab

autocmd Filetype make setlocal noexpandtab

set linebreak

" save .swp files to non project directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" make switching modes quicker
set timeout timeoutlen=1000 ttimeoutlen=0

" Enable highlighting of the current line
set cursorline

set encoding=utf-8
set guifont=Source\ Code\ Pro\ Nerd\ Font\ Complete\ Mono\ 14

" Set custom dict location
set spellfile=~/.vim/spell/en.utf-8.add

if (has("termguicolors"))
  set termguicolors
endif

" ********** NERDTREE CONFIG **********
" disable it when you close the last file
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" toggle it with ctrl + n
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" ********** LIGHTLINE CONFIG **********
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified', 'readonly' ] ],
      \   'right': [ ['lineinfo'], ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'], ['filetype'] ]
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'NoFormat',
      \   'fileencoding': 'NoFormat',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! NoFormat()
  return ''
endfunction

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071  "
let g:lightline#ale#indicator_errors = "\uf05e  "
let g:lightline#ale#indicator_ok = "\uf00c"


" ********** DEOPLETE.NVIM CONFIG **********
let g:deoplete#enable_at_startup = 1

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

" ********** LANGUAGE CONFIG **********
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['black']}
let g:ale_linters = {'go': ['golangci-lint'], 'python': ['flake8', 'mypy', 'pycodestyle', 'pylint']}
let g:ale_lint_delay = 10
let g:ale_go_golangci_lint_executable = "/Users/tristan/go/bin/golangci-lint"
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ********** ULTISNIPS CONFIG **********
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ********** LIVEDOWN CONFIG **********
let g:livedown_open = 1
let g:livedown_browser = "firefox"

" ********** GO CONFIG **********
let g:go_fmt_command = "goimports"
let g:go_list_type = 'quickfix'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'goconst', 'gosec', 'lll', 'unparam', 'deadcode']
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'goconst', 'gosec', 'lll', 'unparam', 'deadcode']

" ********** TERRAFORM CONFIG **********
let g:terraform_align=1
let g:terraform_fmt_on_save=1

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
