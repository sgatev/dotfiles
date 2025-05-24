local lualine = require('lualine')
local noice = require("noice")

lualine.setup({
  options = {
    component_separators = '',
    section_separators   = { left = '', right = '' },
  },
  sections = {
    lualine_b = { 'filename' },
    lualine_c = {},
    lualine_x = {
      {
        noice.api.statusline.mode.get,
        cond = noice.api.statusline.mode.has,
      },
    },
    lualine_y = { 'filetype' },
    lualine_z = {},
  },
})
