-- Two plugins can ship a top level Lua module of the same name. Lua caches
-- modules by name for the whole session, so the first require wins and code
-- expecting the other is left with a module it cannot use.
--
-- The way out is to rename one of them to something nothing else claims, then
-- rewrite the plugins needing it to require the new name. Renaming rather than
-- copying leaves one file answering to the original name, so which plugin gets
-- it stops depending on the order the two happen to be required in. The edits
-- are made on disk, so reinstalling or updating a plugin undoes them.
--
-- Only the top level name is renamed, which is enough unless the two plugins
-- also ship a directory of that name.

local M = {}

local packages = vim.fn.stdpath('data') .. '/site/pack/core/opt'
local markers = vim.fn.stdpath('state') .. '/module-renames'

--- @param file string
--- @return string|nil
local function read(file)
  local ok, lines = pcall(vim.fn.readfile, file)
  return ok and table.concat(lines, '\n') or nil
end

--- @param text string
--- @param file string
local function write(text, file)
  vim.fn.writefile(vim.split(text, '\n'), file)
end

--- Rewrites every require of `module` below `root` to name `alias` instead,
--- whatever quoting the call happens to use. Returns the files it changed.
--- @param root string
--- @param module string
--- @param alias string
--- @return string[]
local function repoint(root, module, alias)
  -- The capture keeps the original quote and any parenthesis as they were.
  local pattern = [[(require%s*%(?%s*)(['"])]] .. vim.pesc(module) .. '%2'
  local replacement = '%1%2' .. alias:gsub('%%', '%%%%') .. '%2'

  local changed = {}
  for _, file in ipairs(vim.fn.glob(root .. '/lua/**/*.lua', false, true)) do
    local text = read(file)
    local rewritten, count = (text or ''):gsub(pattern, replacement)
    if text and count > 0 then
      write(rewritten, file)
      table.insert(changed, file)
    end
  end
  return changed
end

--- @class modules.Rename
--- @field module string The name both plugins claim.
--- @field alias string The name to give the copy.
--- @field provider string Plugin whose copy of the module is renamed.
--- @field consumers string[] Further plugins whose requires are repointed at the
--- renamed module. The provider is always repointed and need not be listed.

--- Resolves one collision. Cheap to call repeatedly: the rename only happens
--- when the original name has reappeared, and a tree is only globbed once a file
--- it changed last time shows the rewrite to have been undone.
--- @param spec modules.Rename
function M.rename(spec)
  local source = ('%s/%s/lua/%s.lua'):format(packages, spec.provider, spec.module)
  local renamed = ('%s/%s/lua/%s.lua'):format(packages, spec.provider, spec.alias)
  if vim.uv.fs_stat(source) then
    vim.uv.fs_rename(source, renamed)
  end

  -- The providing plugin can require the module itself, and would otherwise be
  -- handed whichever copy won the name, so its own tree is rewritten alongside
  -- those of the consumers. The rename happens first, so it is rewritten too.
  local plugins = vim.list_extend({ spec.provider }, spec.consumers)

  for _, plugin in ipairs(plugins) do
    local marker = ('%s/%s.%s'):format(markers, plugin, spec.alias)
    -- A marker names the files rewritten last time. Reading back the first of
    -- them is enough to notice a checkout having restored the originals, which
    -- an untracked marker of its own would not survive to report.
    local recorded = read(marker)
    local witness = recorded and vim.split(recorded, '\n')[1]
    local intact = witness and (read(witness) or ''):find(spec.alias, 1, true)

    if not intact then
      local changed = repoint(
        ('%s/%s'):format(packages, plugin),
        spec.module,
        spec.alias)
      if #changed > 0 then
        vim.fn.mkdir(markers, 'p')
        vim.fn.writefile(changed, marker)
      end
    end
  end
end

return M
