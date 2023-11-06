vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
-- reuse opt
local opt = {noremap = true, silent = true }

-- movement
map("n", "<C-h>", "^", opt)
map("n", "<C-l>", "$", opt)
map("i", "<C-h>", "<Esc>I", opt)
map("i", "<C-l>", "<Esc>A", opt)
map("n", "<C-j>", "8j", opt)
map("n", "<C-k>", "8k", opt)

-- disable arrow keys
map("n", "<Up>", "", opt)
map("n", "<Down>", "", opt)
map("n", "<Left>", "", opt)
map("n", "<Right>", "", opt)
map("i", "<Up>", "", opt)
map("i", "<Down>", "", opt)
map("i", "<Left>", "", opt)
map("i", "<Right>", "", opt)

-- Toggle Tree --
map("n", "<C-b>", ":NvimTreeToggle<CR>", opt)
