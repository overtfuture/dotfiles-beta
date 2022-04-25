function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- STANDARD MAPPINGS
map('', '<leader>c', '"+y')  -- Copy to clipboard in normal, visual, select and operator modes
map('', '<leader>t', ':tabnew<cr>')
map('', '<leader>w', ':q<cr>')
map('', '<leader>~', ':split<cr>:resize 10<cr>:terminal<cr>i')
map('', '<leader>p', ':Glow<cr>')
map('', '<leader><cr>', ':terminal<cr>')

-- PLUGIN MAPPINGS
map('', '<leader>d', ':NvimTreeToggle<cr>')
map('', '<leader>f', ':Telescope find_files<cr>')
