local noice = require("noice")

--- @type table<string, boolean>
local diag_hls = {}

--- @param diag_hl string
--- @return string
local function make_diag_hl(diag_hl)
  local hl = 'StatusLine' .. diag_hl
  if not diag_hls[diag_hl] then
    local default = vim.api.nvim_get_hl(0, { name = 'StatusLineDefault' })
    local diag = vim.api.nvim_get_hl(0, { name = diag_hl })
    vim.api.nvim_set_hl(0, hl, {
      bg = ('#%06x'):format(default.bg),
      fg = ('#%06x'):format(diag.fg),
    })
    diag_hls[diag_hl] = true
  end
  return hl
end

--- Renders the current mode.
--- @return string
local function render_mode()
  local mode_to_str = {
    ['n']     = 'N',
    ['no']    = 'O-P',
    ['nov']   = 'O-P',
    ['noV']   = 'O-P',
    ['no\22'] = 'O-P',
    ['niI']   = 'N',
    ['niR']   = 'N',
    ['niV']   = 'N',
    ['nt']    = 'N',
    ['ntT']   = 'N',
    ['v']     = 'V',
    ['vs']    = 'V',
    ['V']     = 'V-L',
    ['Vs']    = 'V-L',
    ['\22']   = 'V-B',
    ['\22s']  = 'V-B',
    ['s']     = 'S',
    ['S']     = 'S-L',
    ['\19']   = 'S-B',
    ['i']     = 'I',
    ['ic']    = 'I',
    ['ix']    = 'I',
    ['R']     = 'R',
    ['Rc']    = 'R',
    ['Rx']    = 'R',
    ['Rv']    = 'V-R',
    ['Rvc']   = 'V-R',
    ['Rvx']   = 'V-R',
    ['c']     = 'C',
    ['cr']    = 'C',
    ['cv']    = 'EX',
    ['cvr']   = 'EX',
    ['r']     = 'P',
    ['rm']    = 'P',
    ['r?']    = 'P',
    ['!']     = 'SH',
    ['t']     = 'T',
  }
  local mode = mode_to_str[vim.api.nvim_get_mode().mode] or 'UNKNOWN'
  return string.format('%%#StatusLineBright#%s', mode)
end

--- Renders the path of the file loaded in the current buffer.
--- @return string?
local function render_filepath()
  return string.format('%%#StatusLineDefault#%s', vim.fn.expand('%'))
end

--- Renders the current noice mode.
--- @return string?
local function render_noice_mode()
  local noice_mode = noice.api.statusline.mode
  return noice_mode:has() and noice_mode:get() or nil
end

--- @type string?
local last_diagnostics = nil

--- Renders diagnostic counts in the current buffer.
--- @return string?
local function render_diagnostics()
  if vim.startswith(vim.api.nvim_get_mode().mode, 'i') then return last_diagnostics end

  local counts = vim.iter(vim.diagnostic.get(0)):fold({
    ERROR = 0,
    WARN = 0,
    HINT = 0,
    INFO = 0,
  }, function(acc, diagnostic)
    local severity = vim.diagnostic.severity[diagnostic.severity]
    acc[severity] = acc[severity] + 1
    return acc
  end)

  local parts = vim.iter(counts)
      :map(function(severity, count)
        if count == 0 then return nil end
        local hl = 'Diagnostic' .. severity:sub(1, 1) .. severity:sub(2):lower()
        return string.format('%%#%s#%s:%d', make_diag_hl(hl), severity:sub(1, 1), count)
      end)
      :totable()
  if #parts == 0 then return nil end

  last_diagnostics = table.concat(parts, ' ')
  return last_diagnostics
end

--- Renders the active LSP client for the current buffer.
--- @return string?
local function render_lsp()
  local active_clients = vim.iter(vim.lsp.get_clients()):filter(function(client)
    return vim.iter(client.config.filetypes):any(function(filetype)
      return filetype == vim.bo.filetype
    end)
  end):totable()
  if #active_clients == 0 then return nil end
  if #active_clients > 1 then return string.format('%d ls clients', #active_clients) end
  return active_clients[1].name
end

--- Renders the encoding of the file loaded in current buffer.
--- @return string
local function render_encoding()
  return string.format('%%#StatusLineDefault#%s', vim.opt.fileencoding:get():upper())
end

--- Concatenates status line components.
--- @return string
local function concat_components(components)
  return table.concat(vim.iter(components):totable(), '%#StatusLineDefault# • ')
end

local M = {}

--- Renders the status line.
--- @return string
function M.render()
  return concat_components({
        render_mode(),
        render_filepath(),
      }) ..
      '%=' ..
      concat_components({
        render_noice_mode(),
        render_diagnostics(),
        render_lsp(),
        render_encoding(),
      })
end

return M
