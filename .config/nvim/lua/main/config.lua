--------------------------------------------------------------------------------------------------
----- Nvim Configuration
--------------------------------------------------------------------------------------------------

----- Settings
--------------------------------------------------------------------------------------------------
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

----- Clipboard
--------------------------------------------------------------------------------------------------
-- Uses the system clipboard as default
opt.clipboard = 'unnamedplus'

----- Indention Options
-----------------------------
-- New lines inherit the indentation of previous lines.
opt.autoindent = true
--Convert tabs to spaces.
opt.expandtab = true
--Enable indentation rules that are file-type specific.
--filetype indent on
--When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
opt.shiftround = true
--When shifting, indent using four spaces.
opt.shiftwidth = 2
--Insert “tabstop” number of spaces when the “tab” key is pressed.
opt.smarttab = true
--Indent using four spaces.
opt.tabstop = 2

----- Search Options
-----------------------------
--Enable search highlighting.
opt.hlsearch = true
--Ignore case when searching.
opt.ignorecase = true
--Incremental search that shows partial matches.
opt.incsearch = true
--Automatically switch search to case-sensitive when search query contains an uppercase letter.
opt.smartcase = true

----- Performance Options
-----------------------------
--Don’t update screen during macro and script execution.
opt.lazyredraw = true

----- Text Rendering Options
-----------------------------
--Always try to show a paragraph’s last line.
opt.display = 'lastline'
--Use an encoding that supports unicode.
opt.encoding = 'utf-8'
--Avoid wrapping a line in the middle of a word.
opt.linebreak = true
--The number of screen lines to keep above and below the cursor.
opt.scrolloff = 1
--The number of screen columns to keep to the left and right of the cursor.
opt.sidescrolloff = 5
--Enable syntax highlighting.
opt.syntax = 'enable'
--Enable line wrapping.
opt.wrap = true
--Render Colors
opt.termguicolors=true

----- User Interface Options
-----------------------------
--Always display the status bar.
opt.laststatus = 2
--Always show cursor position.
opt.ruler = true
--Display command line’s tab complete options as a menu.
opt.wildmenu = true
--Maximum number of tab pages that can be opened from the command line.
opt.tabpagemax = 50
--Flash the screen instead of beeping on errors.
opt.visualbell = true
--Enable mouse for scrolling and resizing.
opt.mouse = 'a'
--Set the window’s title, reflecting the file currently being edited.
opt.title = true
--Shows the line numbers on the left
opt.number = true

----- Miscellaneous Options
-----------------------------
--Automatically re-read files if unmodified inside Vim.
opt.autoread = true
--Allow backspacing over indention, line breaks and insertion start.
opt.backspace = 'indent,eol,start'
--Display a confirmation dialog when closing an unsaved file.
opt.confirm = true
--Enter visual mode by pressing shift + arrows
opt.keymodel = 'startsel'
