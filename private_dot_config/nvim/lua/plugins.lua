-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile"
})

require('packer').init({
	display = {
		auto_clean = false
	}
})

return require('packer').startup(function(use)

	-- Load lua path
	local lua_path = function(name)
		return string.format("require'plugins.%s'", name)
	end

	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim'}

	-- LSP
	use {'neovim/nvim-lspconfig'}
	use {'onsails/lspkind-nvim'}
	use {
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu'
	}

	-- Autocomplete
	use {
		"hrsh7th/nvim-cmp",
		config = lua_path "cmp",
		requires = {
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-vsnip'},
			{'hrsh7th/vim-vsnip'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-calc'},
			{'hrsh7th/cmp-cmdline'}
		}
	}
	use({
		"petertriho/cmp-git",
		requires = "nvim-lua/plenary.nvim"
	})
	use {'ray-x/cmp-treesitter'}
	use {'lukas-reineke/cmp-rg'}
	use {'quangnguyen30192/cmp-nvim-tags'}
	use {
		'windwp/nvim-autopairs',
		config = lua_path "nvim-autopairs"
	}
	use {'AndrewRadev/tagalong.vim'}
	use {'andymass/vim-matchup'}

	-- Icons
	use {'kyazdani42/nvim-web-devicons'}
	use {'ryanoasis/vim-devicons'}

	-- Theme
	use {'shaunsingh/nord.nvim'}

	-- Status Line and Bufferline
	use {
		'feline-nvim/feline.nvim',
		config = lua_path "feline"
	}
	use {'romgrk/barbar.nvim'}

	-- Telescope
	use {'nvim-lua/popup.nvim'}
	use {'nvim-lua/plenary.nvim'}
	use {
		'nvim-telescope/telescope.nvim',
		config = lua_path "telescope"
	}
	use {'nvim-telescope/telescope-fzy-native.nvim'}
	use {'nvim-telescope/telescope-project.nvim'}
	use {'nvim-telescope/telescope-dap.nvim'}

	-- Explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		config = lua_path "nvimtree"
	}

	-- Registers & clipboard
	use {'tversteeg/registers.nvim'}
	use {
		'AckslD/nvim-neoclip.lua',
		config = lua_path "nvim-neoclip"
	}

	-- General Plugins
	use {
		'wfxr/minimap.vim',
		config = lua_path "minimap"
	}
	use {'folke/trouble.nvim'}

	-- Markdown
	use {
		"ellisonleao/glow.nvim",
		branch = 'main'
	}
	-- GoLang
	use {
		"fatih/vim-go",
		run = 'GoUpdateBinaries'
	}
	use "ray-x/navigator.lua"
	use {
		"ray-x/guihua.lua",
		run = 'cd lua/fzy && make'
	}
	use {
		"lervag/vimtex",
		opt = true
	}

end)
