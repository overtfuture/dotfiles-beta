local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


-------------------- HELPERS -------------------------------
local cmd     = vim.cmd  	-- to execute Vim commands e.g. cmd('pwd')
local fn 	    = vim.fn    	-- to call Vim functions e.g. fn.bufnr()
local g 	    = vim.g      	-- a table to access global variables
local opt 	  = vim.opt  	-- to set options
local wo 	    = vim.wo
local bo 	    = vim.bo

bo.expandtab = true

function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Modifiers
g.mapleader = " "
opt.completeopt = "menuone,noselect"

-- MAPPINGS
map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('', '<leader>t', ':tabnew<cr>')
map('', '<leader>w', ':q<cr>')
map('', '<leader>~', ':split<cr>:resize 10<cr>:terminal<cr>i')
map('', '<leader>p', ':Glow<cr>')
map('', '<leader><cr>', ':terminal<cr>')
map('', '<leader>d', ':Neotree float<cr>')
map('', '<leader>f', ':Telescope find_files<cr>')

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
opt.softtabstop = 2
opt.shiftwidth = 2
opt.cursorline = true
opt.numberwidth = 4
opt.scrolloff = 8
opt.hlsearch = true
opt.backspace = 'indent,eol,start'

-- Telescope
require('telescope').setup{
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		--     mappings = {
		--       i = {
		--         -- map actions.which_key to <C-h> (default: <C-/>)
		--         -- actions.which_key shows the mappings for your picker,
		--         -- e.g. git_{create, delete, ...}_branch for the git_branches picker
		--         ["<C-h>"] = "which_key"
		--       }
		--     }
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	}
}

-- Completions
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})


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

-- LuaLine
require('lualine').setup {
	options = { theme = 'nord' }
}


return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Fuzzy File Finding
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Completion
	use {
		"hrsh7th/nvim-cmp", requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/nvim-cmp' },
		}
	}
	use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
	-- Lualine - Vim Airline Alternative
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- Markdown
	use {"ellisonleao/glow.nvim", branch = 'main'}
	-- GoLang
	use {"fatih/vim-go", run='GoUpdateBinaries' }
	use "ray-x/navigator.lua"
	use {"ray-x/guihua.lua", run='cd lua/fzy && make'}
	use {"lervag/vimtex", opt=true}      -- Use braces when passing options
	-- Neo-Tree
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the "open_window_picker" command
				's1n7ax/nvim-window-picker',
				tag = "1.*",
				config = function()
					require'window-picker'.setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { 'terminal' },
							},
						},
						other_win_hl_color = '#e35e4f',
					})
				end,
			}
		},
		window = {
			position = "left",
			width = 30,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
		},
		config = function ()
			-- Unless you are still migrating, remove the deprecated commands from v1.x
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		end
	}
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
