vim.pack.add({
  'https://github.com/gbprod/nord.nvim',
  { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
})

--- Colorscheme and status line colors for each theme of ~/.config/bin/theme.
local themes = {
  dark = {
    colorscheme = 'nord',
    statusline = { bg = '#2E3440', bright = '#D8DEE9', default = '#585b70' },
  },
  light = {
    colorscheme = 'rose-pine-dawn',
    statusline = { bg = '#FAF4ED', bright = '#464261', default = '#797593' },
  },
}

-- Written by ~/.config/bin/theme.
local state_dir = vim.fn.expand('~/.local/state/dotfiles')
local state_file = state_dir .. '/theme'

--- Reads the theme picked by ~/.config/bin/theme.
--- @return 'dark'|'light'
local function read_theme()
  local ok, lines = pcall(vim.fn.readfile, state_file, '', 1)
  return ok and lines[1] == 'light' and 'light' or 'dark'
end

-- Loading a colorscheme clears these, so set them again after each one.
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local colors = themes[vim.o.background].statusline
    vim.api.nvim_set_hl(0, 'StatusLineBright', { fg = colors.bright, bg = colors.bg })
    vim.api.nvim_set_hl(0, 'StatusLineDefault', { fg = colors.default, bg = colors.bg })
  end,
})

--- @param name 'dark'|'light'
local function apply(name)
  -- Before the colorscheme, as nord leaves 'background' alone.
  vim.o.background = name
  vim.cmd.colorscheme(themes[name].colorscheme)
end

local current = read_theme()
apply(current)

-- The directory is watched rather than the file, which the script replaces.
vim.fn.mkdir(state_dir, 'p')
local watcher = assert(vim.uv.new_fs_event())
watcher:start(state_dir, {}, vim.schedule_wrap(function(_, filename)
  if filename ~= 'theme' then return end
  local theme = read_theme()
  if theme == current then return end
  current = theme
  apply(theme)
end))
