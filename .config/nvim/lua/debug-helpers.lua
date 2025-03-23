-- From and lots of my tweaks:
--   https://github.com/echasnovski/nvim/tree/6c742dbf4e87792d113f42301a7206d5134191fc/plugin
--   https://github.com/folke/snacks.nvim/blob/main/lua/snacks/debug.lua

_G.Debug = {}
_G.bt = function(...) Debug.backtrace(...) end

Debug.log = {}

local _date = function()
  local _, ms = vim.uv.gettimeofday()
  return os.date "%m-%d %H:%M:%S." .. string.format("%.3d ", ms % 1000)
end

local _prune_log = function()
  if #Debug.log > 3000 then Debug.log = { unpack(Debug.log, 3000 - 3000 / 4) } end
end

local _add_to_log = function(prefix, data) table.insert(Debug.log, prefix .. data) end

_G.dbg = function(...)
  local c = select("#", ...)
  local parts = {} ---@type string[]
  for i = 1, c do
    local v = select(i, ...)
    parts[i] = type(v) == "string" and v or vim.inspect(v)
  end

  local msg = table.concat(parts, " ")
  local date = _date()
  if #msg < 120 then
    table.insert(Debug.log, date .. msg:gsub("%s+", " "))
  else
    local d = date
    for _, v in ipairs(vim.split(msg, "\n")) do
      table.insert(Debug.log, d .. v)
      d = "                   "
    end
  end
  _prune_log()
end

Debug.backtrace = function(...)
  if select("#", ...) > 0 then dbg(...) end

  _add_to_log(_date(), "Backtrace...")
  for level = 3, 20 do
    local info = debug.getinfo(level, "Sln")
    if not info then break end
    if info.what ~= "C" and info.source ~= "lua" then
      local line = "- " .. vim.fn.fnamemodify(info.source:sub(2), ":p:~:.") .. ":" .. info.currentline
      if info.name then
        line = line .. " in " .. info.name .. "()"
      else
        line = line .. " in _anonymous_()"
      end
      _add_to_log("                   ", line)
    end
  end
  _prune_log()
end

local log_buf_id
Debug.show_log = function()
  if log_buf_id == nil or not vim.api.nvim_buf_is_valid(log_buf_id) then
    log_buf_id = vim.api.nvim_create_buf(true, true)
  end
  vim.api.nvim_set_option_value("buflisted", true, { buf = log_buf_id })
  vim.api.nvim_set_option_value("buftype", "nowrite", { buf = log_buf_id })
  vim.api.nvim_win_set_buf(0, log_buf_id)
  vim.api.nvim_buf_set_name(log_buf_id, "debug.log")
  vim.api.nvim_buf_set_lines(log_buf_id, 0, -1, false, Debug.log)
end

Debug.clear_log = function()
  Debug.log = {}
  vim.cmd 'echo "Cleared log"'
  dbg "Cleared log"
end
