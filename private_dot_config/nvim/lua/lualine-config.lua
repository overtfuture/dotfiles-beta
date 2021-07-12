-- Lualine - Vim Airline Alternative
require('lualine').setup {
	options = {
		theme = 'nord',
		section_separators = {'', ''},
		component_separators = {'', ''}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location', 'hostname'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {'hostname'}
	},
	tabline = {},
	extensions = {}
}


