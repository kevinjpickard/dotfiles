if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/dein')
  call dein#begin('$HOME/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('neomake/neomake')
  call dein#add('scrooloose/syntastic')
  call dein#add('dag/vim-fish')
  call dein#add('PProvost/vim-ps1')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-dispatch')
  call dein#add('saltstack/salt-vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('rcabralc/monokai-airline.vim')
  call dein#add('sickill/vim-monokai')
  call dein#add('rizzatti/dash.vim')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('bagrat/vim-workspace')
  call dein#add('phanviet/vim-monokai-pro')
  call dein#add('kaicataldo/material.vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('janko-m/vim-test')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Install uninstalled plugins on startup
if dein#check_install()
  call dein#install()
endif

" Indent with 2 spaces, not tabs
set laststatus=2
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" Gherkin syntax
au Bufread,BufNewFile *.feature set filetype=gherkin
syntax on

set backspace=indent,eol,start
set number

" if exists('+colorcolumn')
"	set colorcolumn=80
"else
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>79v.\+/
"endif

autocmd vimenter * NERDTree
let NERDTreeShowHidden=1

" persistent undo
if has("persistent_undo")
  let &undodir='$HOME/backups/vim/undo//' " undo files in a folder
  set undofile                         " Save undo history to file
  set undolevels=100000                " Maximum number of undos
  set undoreload=100000                " Save complete files for undo on reload "
endif

" backups
"set backup
"set backupdir=".,$HOME/backups/vim/backups//"
" Ok this isn't cooperating either. Fuck it.
set nobackup
set nowritebackup

" swap files
"let &directory='.,$HOME/backups/vim/swap/'
" Since vim REFUSES to move my swap files, fuck em
set noswapfile

" Open new splits below and to the right
set splitbelow
set splitright

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='molokai'
let g:airline_theme='monokai'

" listchars to show tabs/spaces
"   To enable   :set list
"   To disable  :set nolist 
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

if has("nvim")
  " Neovim changes
  set termguicolors
  "set background = "molokai"
  "colorscheme molokai
  colorscheme monokai
  let g:material_theme_style = 'dark'
  set guicursor=

  " Run NeoMake on read and write operations
  autocmd! BufReadPost,BufWritePost * Neomake

  " Disable inherited syntastic
  let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }

  let g:neomake_serialize = 1
  let g:neomake_serialize_abort_on_error = 1
  let g:jedi#completions_enabled = 0
endif

" Vim-Workspace Config
let g:workspace_powerline_separators = 1
let g:workspace_use_devicons = 1
let g:workspace_tab_icon = "\uf00a"
let g:workspace_left_trunc_icon = "\uf0a8"
let g:workspace_right_trunc_icon = "\uf0a9"

set updatetime=100

let g:tmuxline_theme = 'zenburn'

" Vim-Test Config
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
let test#strategy = "neovim"
