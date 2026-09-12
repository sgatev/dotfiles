vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
})

local fzf_lua = require('fzf-lua')

-- Diff with difftastic, which compares syntax trees rather than lines. Its colors
-- are palette relative, so the terminal's nord theme carries into the preview.
-- Inline beats the side by side default in a pane this narrow.
local difft = 'difft --color=always --display inline --width=$COLUMNS'

-- Passed as 'diff.external' rather than as GIT_EXTERNAL_DIFF because fzf-lua only
-- injects '-C <repository>' into commands which begin with 'git', and previews of a
-- buffer outside the working directory need it.
local function git_difft(args)
  return string.format('git -c diff.external="%s" %s', difft, args)
end

fzf_lua.setup({
  'border-fused',
  winopts = {
    backdrop = 80,
  },
  previewers = {
    git_diff = {
      pager = false, -- difftastic formats its own output.
      cmd_modified = git_difft('diff HEAD'),
      cmd_deleted = git_difft('diff HEAD --'),
      cmd_untracked = git_difft('diff --no-index /dev/null'),
    },
  },
})

fzf_lua.register_ui_select()

vim.keymap.set('n', '<leader>fb', fzf_lua.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>ff', fzf_lua.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', fzf_lua.live_grep, { desc = 'Grep in files' })
vim.keymap.set('n', '<leader>fc', fzf_lua.git_status, { desc = 'Find changed files' })
