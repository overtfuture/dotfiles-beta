local map = require("helpers.keys").map

-- STANDARD MAPPINGS
map('', '<leader>c', '"+y')  -- Copy to clipboard in normal, visual, select and operator modes
map('', '<leader>t', ':tabnew<cr>')
map('', '<leader>w', ':q<cr>')
map('', '<leader>~', ':split<cr>:resize 10<cr>:terminal<cr>i')
map('', '<leader>p', ':Glow<cr>')
map('', '<leader>b', ':BufferNext<cr>')
map('', '<leader>B', ':BufferPrevious<cr>')

-- PLUGIN MAPPINGS
map('', '<leader>d', ':NvimTreeToggle<cr>')
map('', '<leader>f', ':Telescope find_files<cr>')
