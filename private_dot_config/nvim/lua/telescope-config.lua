-- Telescope
map('', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
map('', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
map('', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
map('', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
map('', '<leader>fk', '<cmd>lua require(\'telescope.builtin\').keymaps()<cr>')
