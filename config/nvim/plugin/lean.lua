local lean = require('lean')

lean.setup({
  lsp = {
    init_options = {
      -- Time (in milliseconds) which must pass since latest edit until elaboration begins.
      editDelay = 0,

      -- Whether to signal that widgets are supported.
      hasWidgets = true,
    }
  },
})
