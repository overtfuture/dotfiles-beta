------------------- Paq nvim -------------------------------
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/savq/paq-nvim.git '.. install_path)
end

-------------------- HELPERS -------------------------------
local cmd 	= vim.cmd  	-- to execute Vim commands e.g. cmd('pwd')
local fn 	= vim.fn    	-- to call Vim functions e.g. fn.bufnr()
local g 	= vim.g      	-- a table to access global variables
local opt 	= vim.o  	-- to set options
local wo 	= vim.wo
local bo 	= vim.bo

bo.expandtab = true

function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-------------------- PLUGINS -------------------------------
-- cmd 'packadd paq-nvim'               -- load the package manager
-- local paq = require('paq-nvim').paq  -- a convenient alias

require "paq" {
	-- Requirements
	"savq/paq-nvim";                  -- Let Paq manage itself
	"neovim/nvim-lspconfig";          -- Mind the semi-colons
	"hrsh7th/nvim-compe";
	-- NerdTree
	"kyazdani42/nvim-tree.lua";
	-- Theme
	"arcticicestudio/nord-vim";
	-- Fuzzy File Finding
	"nvim-telescope/telescope.nvim";
	"nvim-lua/popup.nvim";
	"nvim-lua/plenary.nvim";
	-- Lualine - Vim Airline Alternative
	"hoob3rt/lualine.nvim";
	{"kyazdani42/nvim-web-devicons", opt=true};
	-- Markdown
	{"npxbr/glow.nvim", run='GlowInstall'};
	-- GoLang
	{"fatih/vim-go", run='GoUpdateBinaries' };
	"ray-x/navigator.lua";
	{"ray-x/guihua.lua", run='cd lua/fzy && make'};
	{"lervag/vimtex", opt=true};      -- Use braces when passing options
}

-- Theme
cmd 'colorscheme nord' 

-- Modifiers
g.mapleader = " "
opt.completeopt = "menuone,noselect"

-- MAPPINGS
map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('', '<leader>t', ':tabnew<cr>')
map('', '<leader>w', ':q<cr>')
map('', '<leader>j', ':split<cr>:resize 10<cr>:terminal<cr>i')
map('', '<leader>p', ':Glow<cr>')
map('', '<leader>s', ':terminal<cr>')

-- OPTIONS
wo.number = true
wo.relativenumber = true
opt.splitbelow = true
opt.ruler = true
opt.smartcase = true
opt.mouse = 'a'
opt.ignorecase = true
opt.undofile = true
opt.tabstop = 2
opt.cursorline = true
opt.numberwidth = 4
opt.scrolloff = 8
opt.hlsearch = true
opt.backspace = 'indent,eol,start'
-- require('')

-- Completions
require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = {
		border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	};

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = true;
		ultisnips = true;
		luasnip = true;
	};
}

-- File Tree
map('', '<leader>d', ':NvimTreeToggle<cr>')

-- Configs
require('telescope-config')
require('lualine-config')

-- GoLang
lspconfig = require "lspconfig"
lspconfig.gopls.setup {
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
