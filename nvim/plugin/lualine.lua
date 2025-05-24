local lualine = require('lualine')
local noice = require("noice")

lualine.setup({
  sections = {
    lualine_x = {
      {
        noice.api.statusline.mode.get,
        cond = noice.api.statusline.mode.has,
      }
    },
  },
})
