
" Format-mappings
:autocmd FileType javascript,typescirpt,html,css,less,sass,scss,vue,markdown,yaml,json nnoremap <leader>f :Prettier<CR>
:autocmd FileType dart nnoremap <leader>f :FormatCode<CR>


" NerdTree
map <f3> :NERDTreeToggle <CR>


" Fuzzy Search Directory
map ds :FZF<CR>
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" some file commands

" Saving a file
map s :w <CR>
" redo
map r :redo <CR>
" Exiting file with saving the content
map xs :wq <CR>
" Exiting file without saving the content
map xx :q! <CR>
" Exiting
map xt :q <CR>j
" Esc shortcut
imap jk <ESC>


" switching windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" resizing-splits
noremap <silent> <C-S-Up> :resize +10<CR>
noremap <silent> <C-S-Down> :resize -10<CR>
noremap <silent> <C-S-Right> :vertical resize +10<CR>
noremap <silent> <C-S-Left> :vertical resize -10<CR>


" switching tabs commands
nnoremap <M-h> :tabprevious<CR>
nnoremap <M-l> :tabnext<CR>

" Tab switching 
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt


" flutter mappings
map fe :CocCommand flutter.emulators<CR>
map fr :CocCommand flutter.run<CR>
map fq :CocCommand flutter.dev.quit<CR>
map fhr :CocCommand flutter.dev.hotReload<CR>
map fhR :CocCommand flutter.dev.hotRestart<CR>
map fdl :call OpenFlutterLog()<CR>


" autoreloading config file
nnoremap nve :e $MYVIMRC<CR>
nnoremap nvc :so $MYVIMRC<CR>

" autocomplete settings
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"


" comfortable-motion-settings
" scroll based on window height
nnoremap <silent> <C-d> :call comfortable_motion#flick(winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(winheight(0) * -4)<CR>


" coc-commands
nmap <silent> gd :vsplit<CR><Plug>(coc-definition)
nmap <silent> gt :vsp<CR><Plug>(coc-definition)<C-W>T
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction shortcut
nmap <leader>ca :CocAction<CR>

" Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Swap window splits
nnoremap <leader>sw <C-W><C-x>

" Home and End of current line
map <leader>b <Home>
map <leader>e <End>