----- Remaps
--------------------------------------------------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap leader to space
map('', ' ', '<nop>')
vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

----- Native
-----------------------------------------------------------

----- Tabs
-----------------------------------------------------------
-- Access tabs with leader + number row
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')

-- Use CTRL and left/right to change tab
map('n', '<C-j>', ':tabprevious<CR>')
map('n', '<C-k>', ':tabnext<CR>')

----- Plugins
-----------------------------------------------------------
--FzF
map('n', '<leader>p', ':FZF<CR>')
--RipGrep
map('n', '<leader>g', ':Rg<CR>')
--FloatTerm
map('n', '<leader>t', ':FloatermNew --height=0.9 --width=0.9 --wintype=float<CR>')
--Undotree
map('n', '<leader>u', ':UndotreeToggle<CR>')
--Substitute
map('n', '<leader>s', ':%s///g<left><left><left>')
--NerdTree
map('n', '<leader>d', ':NERDTreeToggle<CR>')
--Find files with Telescope using lua
map('n', '<leader>ff', ":lua require'telescope.builtin'.find_files()<CR>")
map('n', '<leader>fg', ":lua require'telescope.builtin'.live_grep()<CR>")
map('n', '<leader>fb', ":lua require'telescope.builtin'.buffers()<CR>")
map('n', '<leader>fh', ":lua require'telescope.builtin'.help_tags()<CR>")
--Toggle Blame
map('n', '<leader>b', ':GitBlameToggle<CR>')

