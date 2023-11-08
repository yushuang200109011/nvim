vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
-- reuse opt
local opt = {noremap = true, silent = false }
local nnoremap = {noremap = false, silent = false }

-- movement
map("", "<C-h>", "^", nnoremap)
map("", "<C-l>", "$", nnoremap)
map("i", "<C-h>", "<Esc>I", opt)
map("i", "<C-l>", "<Esc>A", opt)
map("", "<C-j>", "8j", opt)
map("", "<C-k>", "8k", opt)
map("i", "<C-j>", "<Esc>8ji", opt)
map("i", "<C-k>", "<Esc>8ki", opt)

-- disable arrow keys
map("n", "<Up>", "", opt)
map("n", "<Down>", "", opt)
map("n", "<Left>", "", opt)
map("n", "<Right>", "", opt)

-- Toggle Tree --
map("n", "<C-b>", ":NvimTreeToggle<CR>", opt)

-- search file --
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
