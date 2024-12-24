vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local o = vim.o

o.timeout = true
o.timeoutlen = 500
o.laststatus = 3
o.cursorline = true

opt.relativenumber = false
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.background = "dark"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 999
