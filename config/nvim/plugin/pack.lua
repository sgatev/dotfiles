-- Removes plugins which are still on disk but are no longer added by any
-- `vim.pack.add` call, as happens when one is renamed or dropped.
--
-- This is a command rather than something which runs at startup because a
-- plugin only counts as active once its `vim.pack.add` has run, and the files
-- making those calls are sourced in an arbitrary order relative to this one.
vim.api.nvim_create_user_command('PackClean', function()
  local obsolete = vim.tbl_filter(function(plugin) return not plugin.active end, vim.pack.get())

  if #obsolete == 0 then
    vim.notify('No obsolete plugins.')
    return
  end

  local lines = vim.tbl_map(function(plugin)
    return ('%s from %s'):format(plugin.spec.name, plugin.spec.src)
  end, obsolete)

  local message = ('These plugins will be removed:\n\n%s\n'):format(table.concat(lines, '\n'))
  if vim.fn.confirm(message, 'Proceed? &Yes\n&No', 2, 'Question') ~= 1 then
    return
  end

  vim.pack.del(vim.tbl_map(function(plugin) return plugin.spec.name end, obsolete))
end, { desc = 'Remove plugins no longer in the configuration' })

--- Completes with the names of the installed plugins.
--- @param lead string
--- @return string[]
local function complete_plugin_names(lead)
  local names = vim.tbl_map(function(plugin) return plugin.spec.name end, vim.pack.get())
  return vim.tbl_filter(function(name) return vim.startswith(name, lead) end, names)
end

-- Updates plugins, showing the changelog in a confirmation buffer which is
-- accepted with `:write` and rejected with `:quit`. Updates every plugin when
-- given no arguments.
vim.api.nvim_create_user_command('PackUpdate', function(opts)
  vim.pack.update(#opts.fargs > 0 and opts.fargs or nil)
end, {
  nargs = '*',
  complete = complete_plugin_names,
  desc = 'Update plugins',
})
