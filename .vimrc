if &term =~ "xterm"
  if has("terminfo")
        set t_Co=256
        set t_Sf=<Esc>[3%p1%dm
        set t_Sb=<Esc>[4%p1%dm
  else
        set t_Co=8
        set t_Sf=<Esc>[3%dm
        set t_Sb=<Esc>[4%dm
  endif
endif
"set t_Co=256 "or simply

execute pathogen#infect()
syntax on
filetype plugin indent on
syntax enable "syntax enable should be after terminal t_Co directive
colorscheme atom-dark-256
let mapleader = ','                     "my leader is ',', not the default '\'
set number
set backspace=indent,eol,start          "backspace works as usual - deletes stuff
set runtimepath^=~/.vim/bundle/ctrlp.vim 

"-------------Search---------------"

set hlsearch
set incsearch

"-------------Mappings---------------"

"easy vimrc edit
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"simple hlsearch remove
nmap <Leader><space> :nohlsearch<cr>


"-------------Splits---------------"
set splitbelow
set splitright

"simplify split move from ctrlW+side to ctrlSide
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

",ww and then ,ww in another split will cause them to swap
"this functionality is provided by vim-windowswap

"-------------Auto-Commands----------"

"automatically source vimrc when saved
augroup autosourcing
        autocmd!
        autocmd BufWritePost .vimrc source %
augroup END

"open a NERDTree automatically when vim starts up if no files were specified
"if open always, then just enable: "autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"-------------Downloads----------"
"vim-atom-dark          https://github.com/gosukiwi/vim-atom-dark
"pathogen.vim           https://github.com/tpope/vim-pathogen
"fugitive.vim           git submodule add https://github.com/tpope/vim-fugitive.git bundle/fugitive
"windowswap.vim         git submodule add https://github.com/wesQ3/vim-windowswap.git bundle/windowswap
"nerdtree		git submodule add https://github.com/scrooloose/nerdtree.git bundle/nerdtree
"nerdtree-git-plugin	git submodule add https://github.com/Xuyuanp/nerdtree-git-plugin.git bundle/nerdtree-git-plugin
"ctrlp			git submodule add https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
"syntastic.vim		git submodule add https://github.com/scrooloose/syntastic.git bundle/syntastic
