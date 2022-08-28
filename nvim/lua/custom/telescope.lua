local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        -- Do not to enter a normal-like mode when hitting escape.
        ['<esc>'] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      -- Remove ./ from fd results.
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true
    }
  }
}

require('telescope').load_extension('fzf')
