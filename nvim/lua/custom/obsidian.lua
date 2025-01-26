require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault",
    },
  },

  notes_subdir = "Limbo",
  new_notes_location = "Limbo",

  note_id_func = function(title)
    return title
  end,

  disable_frontmatter = true,

  update_content = function(content)
    return ""
  end,
})
