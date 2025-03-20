-- mapleader must be set before Lazy setup is called, because
-- want it set before any mapping happens
vim.g.mapleader = ","

_G.bt = function() require("snacks.debug").backtrace() end

-- Define main config table to be able to use it in scripts
_G.Debug = {}

-- Log for personal use during debugging
Debug.log = {}

local start_hrtime = vim.uv.hrtime()
_G.dbg = function(...)
  local t = { ... }
  t.timestamp = 0.000001 * (vim.uv.hrtime() - start_hrtime)
  table.insert(Debug.log, vim.deepcopy(t))
end

local log_buf_id
Debug.show_log = function()
  if log_buf_id == nil or not vim.api.nvim_buf_is_valid(log_buf_id) then
    log_buf_id = vim.api.nvim_create_buf(true, true)
  end
  vim.api.nvim_win_set_buf(0, log_buf_id)
  vim.api.nvim_buf_set_lines(log_buf_id, 0, -1, false, vim.split(vim.inspect(Debug.log), "\n"))
end

Debug.clear_log = function()
  Debug.log = {}
  start_hrtime = vim.loop.hrtime()
  vim.cmd 'echo "Cleared log"'
end

_G.dbg2 = function(...)
  local c = select("#", ...)
  local parts = {} ---@type string[]
  for i = 1, c do
    local v = select(i, ...)
    parts[i] = type(v) == "string" and v or vim.inspect(v)
  end
  local msg = table.concat(parts, " ")
  msg = #msg < 120 and msg:gsub("%s+", " ") or msg
  table.insert(Debug.log, os.date "%Y-%m-%d %H:%M:%S " .. msg)
end

Debug.show_log2 = function()
  if log_buf_id == nil or not vim.api.nvim_buf_is_valid(log_buf_id) then
    log_buf_id = vim.api.nvim_create_buf(true, true)
  end
  vim.api.nvim_win_set_buf(0, log_buf_id)
  vim.api.nvim_buf_set_lines(log_buf_id, 0, -1, false, Debug.log)
end
