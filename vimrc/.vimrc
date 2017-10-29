set number
set ruler

set tabstop=4
set shiftwidth=4
set backspace=2
set expandtab

set ruler

set cmdheight=2
set hlsearch    
"Fast search (search as you type)
set incsearch

" My attempts to get rid of that freking annoying bling bling mother**cker bell
set noerrorbells
set novisualbell
set t_vb=
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif
"No more bling bling freaking bell. Don't touch above, because I don't know what it is but it is working

"Set timeout, used for commadns. ex) jkl will exit insert mode if they are pressed 500ms or less in each keystroke.
set tm=500

"Set autoindent
set ai

set foldcolumn=1

syntax enable
set nobackup
set nowb
set noswapfile

set cursorline
set showmatch



"nnoremap 
" <C-U> clears everything in ex mode. A good way to sanitize thigns
"count insert enter esc
nnoremap ; :

nnoremap <Space> <PageDown>
"nnoremap <S-Space> <PageUP>    "mac does not support shift space. It is the same as space internally. curse mac!


"remap shift tab to unindent (same as doing < to the line in visual mode)
inoremap <S-TAB> <C-D>

"remap shift enter to create a new line without going into an insert mode
"map G :<C-U>echo v:count<CR>

inoremap ff <ESC>
vnoremap ff <ESC>
nnoremap ff <ESC>

"remap tab key to switch between tabs
"nnoremap <Tab> :<C-U> v:count1gt
"nnoremap <S-Tab> :<C-U> v:count1gT

nnoremap <Tab> gt
nnoremap <S-Tab> gT

"change the directory to currently opened file by default
" use !cd <path> to change. Relative or absolute, both works
set autochdir


"when deleting, if it is a tab, meaning if there is nothing from cursor to start of first character
"other than white spaces, treat it as delete tabs.
"it is not always constant delete 4 spaces. It is closes tab. 

"<C-o> is used to issued normal commands without leaving INSERT mode

" If you idel in insert mode for too long, it will automatically go to normal mode


" Ctrl - N is autocomplete. 


"Use tab as autoComplete, but a real tab will be place if previous/curr character is empty or previous or current line is /
let output = ""
function! Smart_TabComplete(back)
    if (col('.')==1)
        return "\<tab>"
    endif
    g:output = (getline('.')[col('.')]==' ')
    if (getline('.')[col('.')]==' ')
        if (a:back=='1')
            return "\<c-p>"
        endif
        return "\<c-n>"
    endif

    if (a:back=='1')
        return "\<S-Tab>"
    endif
    return "\<Tab>"

endfunction

inoremap <Tab> <c-r>=Smart_TabComplete(0)<CR>
inoremap <S-Tab> <c-r>=Smart_TabComplete(1)<CR>


