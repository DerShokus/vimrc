""""""
""" DerShokus vimrc 2013 """

" By platform  {{{
if has("gui_running")
    " MS Windows Platform
	if has("gui_win32")
        " set font
		set guifont=Courier\ New:h10
        " for windows portable version
        set runtimepath=D:\Vim\Data\settings\.vim,$VIMRUNTIME 
        """ Set windows hotkeys """
        " Use CTRL-S for saving, also in Insert mode
        noremap <C-S>   :update<CR>
        vnoremap <C-S>  <C-C>:update<CR>
        inoremap <C-S>  <C-O>:update<CR>
	else
		set guifont=Consolas:h14
        let g:tagbar_ctags_bin='~/.local/bin/ctags'
	endif
endif 
"}}}

""" Colors """
colorscheme wombat256mod
syntax on

""" Base edit settings
set backspace=2                        " do backspace on eol and tabs
set encoding=utf-8                     " default character set
set nocompatible                       " disable vi
set noautochdir                        " do not change directory
set wrap                               " do wrap
set linebreak                          " do not break words
set hidden                             " do not reset buffer
set mouse=a                            " enable mouse in console
set showcmd                            " auto complete for commands
set autoread                           " auto reread file
set confirm                            " show dialogs
set laststatus=2                       " size of status bar
set sessionoptions=curdir,buffers,tabpages " TODO?
set clipboard=unnamed                  " use system copy/past buffer
" be silently
set novisualbell
set noerrorbells
set t_vb=                              " do nothing
set title                              " show title in the top of console


""" Tabs and spaces """
set shiftwidth=4                       " size of spaces
set tabstop=4                          " size of tabs
set softtabstop=4                      " size of soft tabs
set autoindent                         " enable auto indents
set expandtab                          " tabs to spaces
set smartindent                        " tabs after { and others

""" 
set nobackup        " do not create backup files
set noswapfile      " do not create swap files


""" Status line """
"set statusline=%F%m%r%h%w\ line:%l\ column:%v\ \ line\ total:%L
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

""" Search """
set hlsearch            " highlight search result
set ignorecase
set smartcase           " if all in low case - search without case
set incsearch           " searching by typing

filetype off  " обязательно!
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

""" Installs """
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'kien/ctrlp.vim'
Bundle 'Syntastic'
Bundle 'The-NERD-tree'
Bundle 'a.vim'
Bundle 'viewdoc'
Bundle 'tpope/vim-fugitive'
" From https://github.com/joyent/node/wiki/Vim-Plugins
Bundle 'Tabular'
Bundle 'hallettj/jslint.vim'
Bundle 'walm/jshint.vim'
Bundle 'moll/vim-node'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'ahayman/vim-nodejs-complete'

Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-session'

Bundle 'https://github.com/airblade/vim-gitgutter.git'

" from http://ahalbert.nfshost.com/Tech/Installing_Tern_for_Vim.html
Bundle 'marijnh/tern_for_vim'
Bundle "Valloric/YouCompleteMe"

Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'

" stippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Optional:
Bundle "honza/vim-snippets"

Bundle "wlangstroth/vim-racket"

Bundle "terryma/vim-multiple-cursors"
Bundle "xolox/vim-colorscheme-switcher"

call vundle#end()
filetype on
filetype plugin indent on     " обязательно!


""" Exeptions """
autocmd FileType make setlocal noexpandtab

""" Base hot keys """
" use normal up/down
nmap <DOWN>     j
nmap <UP>       k
" use visual up/down
nmap j          gj
nmap k          gk
" normal page up/down
nmap <PageUp>   <C-U><C-U>
imap <PageUp>   <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>
" go to split in the normal mode
nmap <C-j>      <C-W>j
nmap <C-k>      <C-W>k
nmap <C-h>      <C-W>h
nmap <C-l>      <C-W>l
" go to the next word in the insert mode
imap <C-j>      <C-o>j
imap <C-k>      <C-o>k
imap <C-h>      <C-o>b
imap <C-l>      <C-o>w
" for the visual mode the same
vmap <C-j>      <C-o>j
vmap <C-k>      <C-o>k
vmap <C-h>      <C-o>b
vmap <C-l>      <C-o>w
" like emacs
nmap <C-e>      $
nmap <C-a>      ^
imap <C-e>      <C-o>A
imap <C-a>      <C-o>^i
vmap <C-e>      <C-o>A
vmap <C-e>      <C-o>^i
" Work with vim-projects
nmap <silent><F9> <Plug>ToggleProject
nmap <silent><F10> :TagbarToggle<cr>
" Work with NERDTree
nmap <C-F9>     :NERDTreeToggle<cr>

" переделай это как-нибуль
set cursorline

map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

set colorcolumn=80

map ,m :make<cr>
map ,a :A<cr>
map ,l :FufBuffer<cr>
map ,f :FufFile **/<cr>

set diffopt=vertical


" For fugitive
map ,gb :Gblame<cr>
map ,gd :Gdiff<cr>
map ,gs :Gstatus<cr>
map ,gc :Gcommit<cr>

let g:easytags_cmd = '/Users/dershokus/.local/bin/ctags'
let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:syntastic_cpp_config_file = '.syntastic.conf'
"""
" Disable NerdTree auto open
autocmd VimEnter * if argc() == 0 | NERDTree | endif
