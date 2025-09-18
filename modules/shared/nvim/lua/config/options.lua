vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("let g:netrw_liststyle = 3")

-- vim.opt.laststatus = 3
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.cursorline = true
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 999
