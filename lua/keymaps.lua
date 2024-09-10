vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
-- reuse opt
local opt = {noremap = true, silent = true }
local nnoremap = {noremap = false, silent = false }
-- plugin keymap --
local pluginKeys = {}

-- movement
map("", "<C-h>", "^", nnoremap)
map("", "<C-l>", "$", nnoremap)
map("i", "<C-h>", "<Esc>I", opt)
map("i", "<C-l>", "<Esc>A", opt)
map("", "<C-j>", "8j", opt)
map("", "<C-k>", "8k", opt)
-- map("i", "<C-j>", "<Esc>8ji", opt)
-- map("i", "<C-k>", "<Esc>8ki", opt)

-- disable arrow keys
map("n", "<Up>", "", opt)
map("n", "<Down>", "", opt)
map("n", "<Left>", "", opt)
map("n", "<Right>", "", opt)

-- Toggle Tree --
map("n", "<C-b>", ":NvimTreeToggle<CR>", opt)

-- tabs --
map("n", "H", ":BufferLineCyclePrev<CR>", opt)
map("n", "L", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-x>", ":BufferLinePickClose<CR>", opt)

-- search file --
map("n", "<C-p>", ":Telescope find_files<CR>", opt)

-- terminal --
map("n", "<C-t>", "<Cmd>ToggleTerm<CR>", opt)
map("t", "<C-t>", "<Cmd>ToggleTerm<CR>", opt)
map('t', '<esc>', [[<C-\><C-n>]], opt)
map('t', '<C-h>', "<Cmd>wincmd h<CR>", opt)
map('t', '<C-j>', "<Cmd>wincmd j<CR>", opt)
map('t', '<C-k>', "<Cmd>wincmd k<CR>", opt)
map('t', '<C-l>', "<Cmd>wincmd l<CR>", opt)
map('t', '<C-w>', [[<C-\><C-n><C-w>]], opt)
