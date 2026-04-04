vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('*')
  },
})

local blink_cmp = require('blink.cmp')

blink_cmp.setup({
  keymap = { preset = 'super-tab' },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})

vim.lsp.config('*', {
  capabilities = blink_cmp.get_lsp_capabilities(nil, true),
})
