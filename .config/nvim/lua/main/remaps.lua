----- Remaps
--------------------------------------------------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap leader to space
map('', ' ', '<nop>')
vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
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
map('n', '<leader>nt', ':NERDTreeToggle<CR>')
--Find files with Telescope using lua
map('n', '<leader>ff', 'require("telescope.builtin").find_files()<CR>')
map('n', '<leader>fg', 'require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fb', 'require("telescope.builtin").buffers()<CR>')
map('n', '<leader>fh', 'require("telescope.builtin").help_tags()<CR>')
--Toggle Blame
map('n', '<leader>b', ':GitBlameToggle<CR>')
