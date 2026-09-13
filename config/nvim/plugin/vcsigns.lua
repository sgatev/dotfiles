vim.pack.add({
  'https://github.com/algmyr/vclib.nvim',
  'https://github.com/lewis6991/async.nvim',
  'https://github.com/algmyr/vcsigns.nvim',
})

-- nvim-ufo installs promise-async, which claims the same top level 'async'
-- module as the async.nvim that vcsigns needs.
--
-- Only the top level name clashes, so the 'async.*' submodules still resolve
-- after the rename.
require('modules').rename({
  module = 'async',
  alias = 'vcsigns_async',
  provider = 'async.nvim',
  consumers = { 'vcsigns.nvim' },
})

local vcsigns = require('vcsigns')

vcsigns.setup({})
