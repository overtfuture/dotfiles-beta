local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.setup{
  defaults = {
    prompt_prefix = "λ -> ",
    selection_caret = "|> ",
    winblend = 20,
    show_line = false,
    set_env = { ["COLORTERM"] = "truecolor" },
    -- Don't pass to normal mode with ESC, problem with telescope-project
    -- mappings = {
    --   i = {
    --     ["<esc>"] = actions.close,
    --   },
    -- },
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

-- Extensions

telescope.load_extension('fzy_native')
telescope.load_extension('project')
telescope.load_extension('neoclip')
