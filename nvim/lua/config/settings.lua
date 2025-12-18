vim.opt.expandtab = true -- pressing tab inserts spaces instead of tabs
vim.opt.softtabstop = 4 -- number of spaces to insert on tab press - affects editor behavior
vim.opt.tabstop = 4 -- number of spaces used to represent/display a <Tab> - affects display behavior only
vim.opt.shiftwidth = 4 -- number of spaces to use for auto indent

vim.opt.smartindent = true -- indent correctly after {
vim.opt.autoindent = true -- copy indent from current line when starting new line

vim.opt.number = true --enable line nuymbers
vim.opt.relativenumber = true -- display line numbers relative to the current cursor position

vim.opt.signcolumn = "yes" -- always show sign column

-- center the cursor in the screen horizontally and vertically
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 999


vim.diagnostic.config({ virtual_text = true }) -- inline diagnostics

vim.opt.cursorline = true -- highlight the current line


vim.opt.termguicolors = true -- enable 24 bit colors
vim.opt.wrap = false -- disable wrap
