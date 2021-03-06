""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uses the system clipboard as default
set clipboard+=unnamedplus

""" Indention Options
"""""""""""""""""""""""""""""
" New lines inherit the indentation of previous lines.
set autoindent
" Convert tabs to spaces.
set expandtab
" Enable indentation rules that are file-type specific.
filetype indent on
" When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftround
" When shifting, indent using four spaces.
set shiftwidth=4
" Insert “tabstop” number of spaces when the “tab” key is pressed.
set smarttab
" Indent using four spaces.
set tabstop=2

""" Search Options
"""""""""""""""""""""""""""""
" Enable search highlighting.
set hlsearch
" Ignore case when searching.
set ignorecase
" Incremental search that shows partial matches.
set incsearch
" Automatically switch search to case-sensitive when search query contains an uppercase letter.
set smartcase

""" Performance Options
"""""""""""""""""""""""""""""
" Limit the files searched for auto-completes.
set complete-=i
" Don’t update screen during macro and script execution.
set lazyredraw

""" Text Rendering Options
"""""""""""""""""""""""""""""
" Always try to show a paragraph’s last line.
set display+=lastline
" Use an encoding that supports unicode.
set encoding=utf-8
" Avoid wrapping a line in the middle of a word.
set linebreak
" The number of screen lines to keep above and below the cursor.
set scrolloff=1
" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5
" Enable syntax highlighting.
syntax enable
" Enable line wrapping.
set wrap

""" User Interface Options
"""""""""""""""""""""""""""""
" Always display the status bar.
set laststatus=2
" Always show cursor position.
set ruler
" Display command line’s tab complete options as a menu.
set wildmenu
" Maximum number of tab pages that can be opened from the command line.
set tabpagemax=50
" Disable beep on errors.
set noerrorbells
" Flash the screen instead of beeping on errors.
set visualbell
" Enable mouse for scrolling and resizing.
set mouse=a
" Set the window’s title, reflecting the file currently being edited.
set title
" Shows the line numbers on the left
set number

""" Miscellaneous Options
"""""""""""""""""""""""""""""
"Automatically re-read files if unmodified inside Vim.
set autoread
"Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start
"Display a confirmation dialog when closing an unsaved file.
set confirm
"Hide files in the background instead of closing them.
set hidden
"Ignore file’s mode lines; use vimrc configurations instead.
set nomodeline
"Enter visual mode by pressing shift + arrows
set keymodel=startsel,stopsel

""" Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "
" FzF
nnoremap <Leader>p :FZF<CR>
" RipGrep
nnoremap <Leader>g :Rg<CR>
" FloatTerm
nnoremap <Leader>t :FloatermNew --height=0.9 --width=0.9 --wintype=float<CR>
" Undotree
nnoremap <Leader>u :UndotreeToggle<CR>
" Substitute
nnoremap <Leader>s :%s///g<left><left><left>
" NerdTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
" Find files with Telescope using lua
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Toggle Blame
nnoremap <leader>b :GitBlameToggle<CR>

""" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
" Plug 'airblade/vim-gitgutter'
" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Retro groove color scheme for Vim
" Plug 'gruvbox-community/gruvbox'
" Nord color scheme for Vim
" Plug 'arcticicestudio/nord-vim'
" https://github.com/folke/tokyonight.nvim
Plug 'folke/tokyonight.nvim'
" The fancy start screen for Vim
"Plug 'mhinz/vim-startify'
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'
" Terminal manager for (neo)vim
Plug 'voldikss/vim-floaterm'
" Tabnine AI autocomplete
" set rtp+=~/.vim/plugged/tabnine-vim
" The undo history visualizer for VIM
Plug 'mbbill/undotree'
" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'
" A solid language pack for vim
Plug 'sheerun/vim-polyglot'
" Highlights trailing whitespace in red and provides :StripWhitespace to fix it.
Plug 'ntpeters/vim-better-whitespace'
" The NERDTree is a file system explorer for the Vim editor
Plug 'preservim/nerdtree'
" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
Plug 'ryanoasis/vim-devicons'
" Needed for devicons color
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug 'elzr/vim-json'
" A Vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Comments
Plug 'numToStr/Comment.nvim'
" Git blame
Plug 'f-person/git-blame.nvim'
" Syntax Highlights
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'm-demare/hlargs.nvim'
" ************** Completion
" ************** https://github.com/ms-jpq/coq_nvim
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" *************** Completion End
" Super fast git decorations implemented purely in lua/teal.
Plug 'lewis6991/gitsigns.nvim'
" Initialize plugin system
call plug#end()

""" Plugins' specific configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Nerdtree
"""""""""""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

""" Lightline
"""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Removes the vim mode information as lightline already shows it
set noshowmode

""" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Retro groove color scheme for Vim
" colorscheme gruvbox
" Nord color scheme
" colorscheme nord
" TokyoNight Color Scheme
colorscheme tokyonight

""" Comment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('Comment').setup()

""" Commands to run on startup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * COQnow

