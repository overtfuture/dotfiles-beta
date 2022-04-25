-- Modifiers
vim.g.mapleader = " "
vim.opt.completeopt = "longest,menuone"
-- The above command will change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item, but rather just inserts the longest common text of all matches; and the menu will come up even if there's only one match. (The longest setting is responsible for the former effect and the menuone is responsible for the latter.)

-- OPTIONS
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.splitbelow = true
vim.opt.ruler = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.undofile = true
vim.bo.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.numberwidth = 4
vim.opt.scrolloff = 8
vim.opt.hlsearch = true
vim.opt.backspace = 'indent,eol,start'
