set number
set mouse=a
set cin
set ts=4
set encoding=utf-8

"+++++++++++++++++++++++++++++++++ Load Plugins +++++++++++++++++++++++++++++++++"

" load vim-plug plugin
call plug#begin('~/.vim/plugged')

" plugins
Plug 'ap/vim-css-color'
Plug 'dense-analysis/ale'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" set colormap
colorscheme codedark

"leaving insert mode by pressing either jk or kj
inoremap jk <esc>
inoremap kj <esc>

" fix pasting from other applications
set pastetoggle=<F2>

" auto close brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Skipping over closing brackets and quotes
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> "  strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"

" when brace + enter is pressed automatically add indent correctly and add
" missing brace
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko



"+++++++++++++++++++++++++++++++++ Netrw (file menu) +++++++++++++++++++++++++++++++++"
" appearance
let g:netrw_liststyle = 3 
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
" start netrw silent
let g:netrw_silent = 1
" when pressing v open in window on right of tree
let g:netrw_altv=1
" close window after opening file
let g:netrw_fastbrowse=0
" Netrw toggle function
let g:NetrwIsOpen = 0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction


"+++++++++++++++++++++++++++++++++ Key Bindings +++++++++++++++++++++++++++++++++"

" Change tab bindings (alt+j/alt+k)
" and set M-l to save file
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"

nnoremap <M-j> :tabp<CR>
nnoremap <M-k> :tabn<CR>
nnoremap <M-l> :w <CR>

" toggle netrw 
map " :call ToggleNetrw()<CR>
