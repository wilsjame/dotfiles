autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -Wall % -o out <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -std=c++17 -Wall % -o out && ./out <CR>
syntax on
filetype indent on
"hi LineNr ctermfg=DarkGray ctermbg=None
hi LineNr ctermfg=DarkGray ctermbg=None
"set rnu             " relative numbering
set nu
set mouse=a         " enable mouse usage (all modes)
set showcmd         " show (partial) command in status line	
set report=0        " threshold for reporting number of lines changed
set incsearch       " highlights pattern match as you type 
set hlsearch
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
let &statusline.="\'%{matchstr(getline('.'), '\\%' . col('.') . 'c.')}\'\ "
set statusline+=%b\ 
set statusline+=0x%B 

highlight Comment ctermfg=green

let g:netrw_liststyle = 3 " netrw default to tree view

" switch between window splits using Ctrl-[hjkl] instead of Ctrl-w [hjkl]
nnoremap <C-h> <C-w>h  
nnoremap <C-j> <C-w>j  
nnoremap <C-k> <C-w>k  
nnoremap <C-l> <C-w>l  
