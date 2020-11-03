autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -Wall % -o out <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -std=c++17 -Wall % -o out && ./out <CR>
syntax on
filetype indent on
hi LineNr ctermfg=DarkGray ctermbg=None
set rnu             " relative numbering
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
set background=dark " set when using tmux on mac
"set showmatch      " show matching brackets
hi StatusLine ctermfg=black ctermbg=DarkGray
set laststatus=2
set statusline=     " left side
set statusline+=%F
set statusline+=%=  " right side
let &statusline.="\'%{matchstr(getline('.'), '\\%' . col('.') . 'c.')}\'\ "
set statusline+=%b\ 
set statusline+=0x%B 
