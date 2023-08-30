return {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require('telescope').setup {
            defaults = {
                prompt_prefix = "λ -> ",
                selection_caret = "|> ",
                winblend = 20,
                show_line = false,
                set_env = {
                    ["COLORTERM"] = "truecolor"
                },
                mappings = {}
            },
            extensions = {
                fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true
                },
            }
        }

        require('telescope').load_extension('neoclip')

    end
}
