"
"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"                Vim Plug               
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"
if !empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  call plug#begin('~/.nvim/plugged')
  " Vim Airline
  Plug 'vim-airline/vim-airline'
  " Nerd Tree
  Plug 'scrooloose/nerdtree'
  " Nerd Commenter <leader c>
  Plug 'scrooloose/nerdcommenter'
  " Nerd Tree Git Status
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " NerdTree File Icons
  Plug 'ryanoasis/vim-devicons'
  " Shot-f highlights the characters where the cursor can move directly (by f,F,t,T).
  Plug 'deris/vim-shot-f'
  " Git Gutter for editor git status
  Plug 'airblade/vim-gitgutter'
  " Fzf
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  " Vim Polygot Syntax support
  Plug 'sheerun/vim-polyglot'
  " GoLang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Marked.app
  Plug 'itspriddle/vim-marked'
  " Nord Theme
  Plug 'arcticicestudio/nord-vim'
  " Polygot Languages
  Plug 'hashivim/vim-terraform'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'towolf/vim-helm'
  Plug 'cespare/vim-toml'
  Plug 'stephpy/vim-yaml'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-markdown'
  Plug 'leshill/vim-json'
  call plug#end()
endif
"
"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"                NerdTree               
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"
let NERDTreeIgnore = ['\.pyc$', '.DS_Store']
nmap <leader>1 :NERDTreeToggle<CR>

" Auto close after opening file
let NERDTreeQuitOnOpen = 1
" Refresh buffer after deletion
let NERDTreeAutoDeleteBuffer = 1
" Looks
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
"
"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"                Terminal               
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"
nmap <leader>2 :terminal<CR>

if ((has("gui_running") || &termguicolors))
  set termguicolors
endif
"
"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"           Mouse & Scrolling           
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
end

"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"            Chezmoi Dotfiles           
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %

"
"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"             User Interface            
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"
silent! colorscheme nord

" Show line numbers
set number
" Show relative lines above and below
set relativenumber
" Always show current position
set ruler
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Set Backspace to work like most programs
set backspace=indent,eol,start
" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
" Enable syntax highlighting
syntax enable

"
"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"             Vim Airline            
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '  '

"
"  ┏ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┓
"                 GoLang              
"  ┗ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ┛
"
let g:go_auto_type_info = 1
