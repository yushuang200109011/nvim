-- Hint: use `:h <option>` to figure out the meaning if needed

-- utf-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- clipboard and mouse
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.mouse = '' -- not allow mouse, use vim.opt.mouse = 'a' to allow

-- complete
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.wo.signcolumn = "yes"

-- Tab
vim.bo.tabstop = 2 -- number of visual spaces per TAB
vim.o.softtabstop = 2 -- number of spacesin tab when editing
vim.o.shiftwidth = 2 -- insert 4 spaces on a tab
vim.o.shiftround = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- UI config
vim.wo.number = true -- show absolute number
vim.wo.relativenumber = true -- add numbers to each line on the left side
vim.o.scrolloff = 8 -- stay 8 lines up and down
vim.o.sidescrolloff = 8
vim.o.cursorline = false -- highlight cursor line underneath the cursor horizontally
-- vim.opt.splitbelow = true -- open new vertical split bottom
-- vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.o.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- vim.o.list = true
-- vim.o.listchars = "space:·" -- show space as .

-- vim.o.background = "dark" -- dark mode
-- vim.o.termguicolors = true
-- vim.opt.termguicolors = true

-- Searching
vim.o.incsearch = true -- search as characters are entered
vim.o.hlsearch = true -- do not highlight matches
vim.o.ignorecase = true -- ignore case in searches by default
vim.o.smartcase = true -- but make it case sensitive if an uppercase is entered

-- other
vim.o.hidden = true -- allow to hide modified buffer

-- about tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
