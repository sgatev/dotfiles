vim.pack.add({
  'https://github.com/ziglang/zig.vim',
})

-- Formatting is handled by zls, through the LSP format keymap.
vim.g.zig_fmt_autosave = 0
