----- Plugins
--------------------------------------------------------------------------------------------------

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

-- Defaults everyone can agree on
Plug('tpope/vim-sensible')
-- A Git wrapper so awesome, it should be illegal
Plug('tpope/vim-fugitive')
-- Shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
-- Plug('airblade/vim-gitgutter'
-- A command-line fuzzy finder
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug('junegunn/fzf.vim')
-- Retro groove color scheme for Vim
-- Plug('gruvbox-community/gruvbox'
-- Nord color scheme for Vim
-- Plug('arcticicestudio/nord-vim'
-- https://github.com/folke/tokyonight.nvim
Plug('folke/tokyonight.nvim')
-- Fuzzy file, buffer, mru, tag, etc finder.
Plug('kien/ctrlp.vim')
-- Terminal manager for (neo)vim
Plug('voldikss/vim-floaterm')
-- The undo history visualizer for VIM
Plug('mbbill/undotree')
-- A light and configurable statusline/tabline plugin for Vim
Plug('itchyny/lightline.vim')
-- A solid language pack for vim
Plug('sheerun/vim-polyglot')
-- Highlights trailing whitespace in red and provides :StripWhitespace to fix it.
Plug('ntpeters/vim-better-whitespace')
-- The NERDTree is a file system explorer for the Vim editor
Plug('preservim/nerdtree')
-- Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
Plug('ryanoasis/vim-devicons')
-- Needed for devicons color
Plug('tiagofumo/vim-nerdtree-syntax-highlight')
-- A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug('elzr/vim-json')
-- A Vim plugin for visually displaying indent levels in code
Plug('nathanaelkane/vim-indent-guides')
-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0'})
-- Comments
Plug('numToStr/Comment.nvim')
-- Git blame
Plug('f-person/git-blame.nvim')
-- ************** Completion
-- ************** https://github.com/ms-jpq/coq_nvim
Plug('ms-jpq/coq_nvim', {branch = 'coq'})
-- 9000+ Snippets
Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})
-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
-- Need to **configure separately**
Plug('ms-jpq/coq.thirdparty', {branch = '3p'})
-- - shell repl
-- - nvim lua api
-- - scientific calculator
-- - comment banner
-- *************** Completion End
-- Super fast git decorations implemented purely in lua/teal.
Plug('lewis6991/gitsigns.nvim')
-- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
Plug('kyazdani42/nvim-web-devicons') -- Recommended (for coloured icons)

-- Initialize plugin system
vim.call('plug#end')

--------------------------------------------------------------------------------------------------
----- Plugins' specific configuration
--------------------------------------------------------------------------------------------------

----- Nerdtree
-----------------------------
vim.g['NERDTreeDirArrowExpandable'] = '+'
vim.g['NERDTreeDirArrowCollapsible'] = '-'

vim.g['NERDTreeDisableFileExtensionHighlight'] = 1
vim.g['NERDTreeDisableExactMatchHighlight'] = 1
vim.g['NERDTreeDisablePatternMatchHighlight'] = 1

----- Lightline
-----------------------------
vim.g['lightline'] = {
  colorscheme = 'wombat',
  active = {
    left = {{'mode', 'paste'}, {'gitbranch', 'readonly', 'filename', 'modified'}}
  },
  tabline = {
    left = {{'buffers'}},
    right = {{'close'}}
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers'
  },
  component_type = {
    buffers = 'tabsel'
  }
}

-- Removes the vim mode information as lightline already shows it
-- set noshowmode

----- COQ
-----------------------------
vim.g.coq_settings = {
  auto_start = true,
}

----- Theme
--------------------------------------------------------------------------------------------------
-- Retro groove color scheme for Vim
-- colorscheme gruvbox
-- Nord color scheme
-- colorscheme nord
-- TokyoNight Color Scheme
vim.cmd[[colorscheme tokyonight]]
-- Enable the tokyonight colorscheme for Lightline
vim.g['lightline'] = {colorscheme = 'tokyonight'}

----- Comment
--------------------------------------------------------------------------------------------------
require('Comment').setup()

