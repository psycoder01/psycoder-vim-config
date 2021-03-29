" recognize ts,tsx as typescript files
au BufNewFile,BufRead *.tsx setlocal filetype=typescriptreact
au BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact

let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
autocmd BufWritePre *.php Prettier
let b:prettier_ft_default_args = {
  \ 'parser': 'php',
  \ }

" Gruvbox
"let g:gruvbox_contrast_dark = "hard"
"colorscheme gruvbox
let g:serenade_enable_italic = 1
let g:serenade_transparent_background = 1
let g:serenade_diagnostic_text_highlight = 1
let g:serenade_diagnostic_line_highlight = 0
colorscheme serenade

" Formatter Settings
map <silent><leader>f :FormatCode<CR>

" NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrows = 1
let NERDTreeMinimalUI=1
" NerdTree-brackets-concealing
let g:rainbow_conf={
            \'separately':{
            \'nerdtree':0,
            \}
            \}
" NerdTree on every tab
autocmd BufWinEnter * silent NERDTreeMirror
autocmd StdinReadPre * let s:std_in=1
" NerdTree on vim enter
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Exit window if NerdTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Show hidden files by default
let NERDTreeShowHidden = 1
" Check if current window is NerdTree
fun! s:IsCurrentWindowNERDTree()
  return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
endfun
fun! s:NERDTreeTrick()
  if s:IsCurrentWindowNERDTree()
    wincmd p    
  endif
endfun
map <f3> :NERDTreeToggle<CR> :call <SID>NERDTreeTrick()<CR>
autocmd TabLeave * call s:NERDTreeTrick()

" NerdCommenter
filetype plugin on

" FZF
" Ignore some folders
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_preview_window = 'right:60%'
command! -bang Windows call fzf#vim#windows({'options': ['--query', '!NERD ']}, <bang>0)

" Menu Suggestions
set wildmenu


" Rainbow-brackets
let g:rainbow_active = 1


" Indent GuideLines
set conceallevel=1
let g:indentLine_conceallevel = 1
let g:indentLine_color_term = 8
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = ["nerdtree"]


" Tmuxline
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F']}


" Vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_b=''
let g:airline_theme='wombat'

" Snippets
autocmd BufRead,BufNewFile,BufEnter *.dart UltiSnipsAddFiletypes dart-flutter
let g:user_emmet_settings = {
\ 'typescript' : {
\     'extends' : 'jsx',
\ },
\}
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim-json character concealing fix
let g:vim_json_syntax_conceal = 0

" Closing tag
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact,typescript,typescriptreact'
let g:closetag_regions = {
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ 'typescript': 'jsxRegion,tsxRegion',
    \ 'javascript': 'jsxRegion',
    \ }

" Gitgutter
set updatetime=100

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_relative_time = 1

" Vim airline
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(['branch',' ','hunks'])
    let g:airline_section_z = airline#section#create(['%l',':%c','/%L'])
endfunction
autocmd VimEnter * call AirlineInit()

" COC
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Vista Window
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'javascriptreact': 'coc',
  \ 'typescriptreact': 'coc',
  \ }
let g:vista_fzf_preview = 1
"let g:vista_fzf_preview = ['right:80%']
let g:vista#renderer#enable_icon = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
