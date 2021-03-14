" make background transparent so it is set by the host rather than the shell
" theme.
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

if (has("termguicolors"))
 set termguicolors
endif

let g:onedark_color_overrides = {
  \ "dark_yellow": { "gui": "#FFD740", "cterm": "173", "cterm16": "11" },
  \ "green": { "gui": "#50FA7B", "cterm": "114", "cterm16": "2" },
  \ "purple": { "gui": "#BD93F9", "cterm": "170", "cterm16": "5" },
  \ "yellow": { "gui": "#F1FA8C", "cterm": "180", "cterm16": "3" }
  \ }

syntax on
colorscheme onedark
