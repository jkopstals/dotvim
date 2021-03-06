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
set relativenumber      		"shows relative position of the cursor to ease movement
set backspace=indent,eol,start          "backspace works as usual - deletes stuff
set runtimepath^=~/.vim/bundle/ctrlp.vim 

"-------------Tabs and spaces------"
set autoindent                 "always set autoindenting on
set copyindent                 "copy the previous indentation on autoindenting"
set expandtab
set shiftwidth=4               " nombre d'espace apres un '>>'
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'"
set tabstop=4                  " nombre de place que prend une tabulatio
set smarttab


"-------------Search---------------"

set hlsearch
set incsearch

"-------------Autocomplete---------------"
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone

"-------------syntastic---------------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-------------airline---------------"

let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"-------------Mappings---------------"

"easy vimrc edit
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"simple hlsearch remove
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
""Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

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

"delete spaces at end of line
autocmd BufWritePre !*.xml silent! %s/[\r \t]\+$//
" retab to replace tab by space when you write
autocmd BufWritePre *.php :set et|retab

"automatically source vimrc when saved
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

augroup sparkup_types
	autocmd!
	autocmd FileType php runtime! ftplugin/html/sparkup.vim
augroup END

"-------------NERDTree----------"
"
"open a NERDTree automatically when vim starts up if no files were specified
"if open always, then just enable: "autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeHijackNetrw=0
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'

nmap <C-N> :NERDTreeToggle<cr>

"-------------CtrlP----------"
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
nmap <C-r> :CtrlPBufTag<cr>

"-------------Downloads----------"
"
"remember Vinegar uses dash "-" for going back up directory tree, and also
"from file

"-------------Downloads----------"
"vim-atom-dark          https://github.com/gosukiwi/vim-atom-dark
"pathogen.vim           https://github.com/tpope/vim-pathogen
"fugitive.vim           git submodule add https://github.com/tpope/vim-fugitive.git bundle/fugitive
"windowswap.vim         git submodule add https://github.com/wesQ3/vim-windowswap.git bundle/windowswap
"nerdtree		git submodule add https://github.com/scrooloose/nerdtree.git bundle/nerdtree
"nerdtree-git-plugin	git submodule add https://github.com/Xuyuanp/nerdtree-git-plugin.git bundle/nerdtree-git-plugin
"ctrlp			git submodule add https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
"syntastic.vim		git submodule add https://github.com/scrooloose/syntastic.git bundle/syntastic
"vim-airline		git submodule add https://github.com/vim-airline/vim-airline bundle/vim-airline
"phpcomplete		git submodule add https://github.com/shawncplus/phpcomplete.vim.git bundle/phpcomplete
"supertab		git submodule add https://github.com/ervandew/supertab.git bundle/supertab
"vim-vinegar 		git submodule add https://github.com/tpope/vim-vinegar.git bundle/vim-vinegar
"sparkup 		git submodule add https://github.com/rstacruz/sparkup.git bundle/sparkup
