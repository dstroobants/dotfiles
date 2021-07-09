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
set tabstop=4

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

""" Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fern : map leader + f to fern toggle
nnoremap <silent><Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR>
" FzF
nnoremap <Leader>p :FZF<CR>
" RipGrep
nnoremap <Leader>g :Rg<CR>
" FloatTerm
nnoremap <Leader>t :FloatermNew --height=0.9 --width=0.9 --wintype=float<CR>
" ctrlp
nnoremap <Leader>c :CtrlPMixed<CR>
" Undotree
nnoremap <Leader>u :UndotreeToggle<CR>
" Substitute
nnoremap <Leader>s :%s///g<left><left><left>

""" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'
" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" General purpose asynchronous tree viewer written in Pure Vim script
Plug 'lambdalisue/fern.vim'
" Fix for Fern's cursor performance issue
Plug 'antoinemadec/FixCursorHold.nvim'
" Add Git status badge integration on file:// scheme on fern.vim
Plug 'lambdalisue/fern-git-status.vim'
" Retro groove color scheme for Vim
"Plug 'gruvbox-community/gruvbox'
" Nord color scheme for Vim
Plug 'arcticicestudio/nord-vim'
" The fancy start screen for Vim
Plug 'mhinz/vim-startify'
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'
" Terminal manager for (neo)vim
Plug 'voldikss/vim-floaterm'
" Tabnine AI autocomplete
set rtp+=~/.vim/plugged/tabnine-vim
" The undo history visualizer for VIM
Plug 'mbbill/undotree'
" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'
" A solid language pack for vim
Plug 'sheerun/vim-polyglot'
" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'

" Initialize plugin system
call plug#end()

""" Plugins' specific configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fern's cursor
"""""""""""""""""""""""""""""
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100

" Fern
"""""""""""""""""""""""""""""
" Disable netrw (Default vim file explorer as we are using fern)
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1
let g:fern#default_hidden = 1

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark)
  nmap <buffer> K <Plug>(fern-action-mark-children:leaf)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

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
" colorscheme Gruvbox
" Nord color scheme
colorscheme nord

