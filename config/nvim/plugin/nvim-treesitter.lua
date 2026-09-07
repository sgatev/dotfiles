vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
})

local nvim_treesitter = require('nvim-treesitter')

-- Parsers are compiled by the tree-sitter CLI, and installed asynchronously.
-- This is a no-op once they are present.
local install = nvim_treesitter.install({
  'bash',
  'c',
  'cpp',
  'go',
  'gomod',
  'gosum',
  'lua',
  'markdown',
  'markdown_inline',
  'rust',
  'zig',
})

-- Block while bootstrapping from a script, where there is no UI to return to.
if #vim.api.nvim_list_uis() == 0 then
  install:wait(300000)
end

-- Highlighting is provided by Neovim. Enable it for any filetype whose parser
-- is installed, so the list above is the only one to keep up to date. Lean is
-- deliberately absent upstream, and falls back to lean.nvim's syntax file.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(event.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(event.buf, lang)
    end
  end,
})

-- Parsers are pinned to the plugin, so refresh them whenever it updates.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    if event.data.spec.name == 'nvim-treesitter' and event.data.kind == 'update' then
      nvim_treesitter.update()
    end
  end,
})
