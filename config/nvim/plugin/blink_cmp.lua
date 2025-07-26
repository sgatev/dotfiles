local blink_cmp = require('blink.cmp')

blink_cmp.setup({
  keymap = { preset = 'super-tab' },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})
