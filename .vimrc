autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -Wall % -o out <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -std=c++17 -Wall % -o out && ./out <CR>
autocmd filetype python nnoremap <F5> :w <bar> !python3 %<CR>
autocmd filetype python nnoremap <C-\> :w <bar> !python3 %
autocmd filetype ruby nnoremap <F5> :w <bar> !ruby %<CR>
autocmd filetype go nnoremap <F5> :w <bar> !go build <CR>
autocmd filetype go nnoremap <F6> :w <bar> !go run % <CR>
autocmd filetype cs nnoremap <F5> :w <bar> !dotnet run % <CR>
autocmd filetype cs setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd filetype html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd filetype javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd filetype rst setlocal shiftwidth=3 softtabstop=3 expandtab
syntax on
filetype indent on
let g:go_highlight_trailing_whitespace_error=0
"hi LineNr ctermfg=DarkGray ctermbg=None
hi LineNr ctermfg=DarkGray ctermbg=None

" highlight current line number
set cursorline
hi cursorline cterm=none
hi CursorLineNr cterm=bold ctermfg=Darkblue ctermbg=None

" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins. :source % :PlugInstall
"Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json'
Plug 'yuezk/vim-js'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" emmet config
"redefine trigger key
let g:user_emmet_leader_key=','

"set rnu             " relative numbering
set nu
set visualbell      " disable beep (WSL)
set mouse=a         " enable mouse usage (all modes)
set showcmd         " show (partial) command in status line	
set report=0        " threshold for reporting number of lines changed
set incsearch       " highlights pattern match as you type 
set hlsearch
set shortmess-=S    " show number of search matches
set smartcase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smarttab
set expandtab
"set background=dark " set when using tmux on mac
"set showmatch      " show matching brackets
"hi StatusLine ctermfg=black ctermbg=DarkGray
hi StatusLine ctermfg=DarkGray ctermbg=red
set ruler
set laststatus=2
set statusline=     " left side
set statusline+=%F
set statusline+=%=  " right side
set statusline+=%1*%=%5l%*      "current line
set statusline+=%2*/%L%*        "total lines
set statusline+=%1*%4v\ %*      "virtual column number
"let &statusline.="\'%{matchstr(getline('.'), '\\%' . col('.') . 'c.')}\'\ "
set statusline+=%b\ 
set statusline+=0x%B 

highlight Comment ctermfg=green

let g:netrw_liststyle = 3 " netrw default to tree view

" switch between window splits using Ctrl-[hjkl] instead of Ctrl-w [hjkl]
nnoremap <C-h> <C-w>h  
nnoremap <C-j> <C-w>j  
nnoremap <C-k> <C-w>k  
nnoremap <C-l> <C-w>l  

" auto complete brackets
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

" folding
" https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
set foldlevelstart=20
autocmd Syntax python setlocal foldmethod=indent
autocmd Syntax python normal zR
hi Folded ctermbg=black

" --------------------------------------------------------
" Double tap to jump back and forth between two tab pages.
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
autocmd TabLeave ** let prev = tabpagenr()
autocmd TabEnter ** let curr = tabpagenr()

function! Jump()

    if g:prev > tabpagenr('$')
      echo "Could not reach previous tab, maybe you closed it?"
    else
      execute "tabn ".g:prev
      " echo "current tab ".g:curr "previous tab ".g:prev
    endif

endfunction

nmap <silent> tt :call Jump()<CR>
