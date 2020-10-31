autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -Wall % -o out <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -std=c++17 -Wall % -o out && ./out <CR>
syntax on
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
"set background=dark
"set showmatch      " show matching brackets
