-- Define main Debug config table to be able to use it in scripts

_G.Debug = {}
_G.bt = function(...) Debug.backtrace(...) end

Debug.log = {}

local log_buf_id

_G.dbg = function(...)
  local c = select("#", ...)
  local parts = {} ---@type string[]
  for i = 1, c do
    local v = select(i, ...)
    parts[i] = type(v) == "string" and v or vim.inspect(v)
  end

  local msg = table.concat(parts, " ")
  local _, ms = vim.uv.gettimeofday()
  local date = os.date "%m-%d %H:%M:%S" .. string.format(".%-3d ", ms % 1000)
  if #msg < 120 then
    table.insert(Debug.log, date .. msg:gsub("%s+", " "))
  else
    local d = date
    for _, v in ipairs(vim.split(msg, "\n")) do
      table.insert(Debug.log, d .. v)
      d = "                    "
    end
  end
  if #Debug.log > 2000 then
    local note = date .. "(debug log trimmed)"
    Debug.log = { note, unpack(Debug.log, 1000) }
  end
end

Debug.show_log = function()
  if log_buf_id == nil or not vim.api.nvim_buf_is_valid(log_buf_id) then
    log_buf_id = vim.api.nvim_create_buf(true, true)
  end
  vim.api.nvim_win_set_buf(0, log_buf_id)
  vim.api.nvim_buf_set_lines(log_buf_id, 0, -1, false, Debug.log)
end

Debug.clear_log = function()
  Debug.log = {}
  vim.cmd 'echo "Cleared log"'
end

Debug.backtrace = function(...)
  if select("#", ...) > 0 then dbg(...) end

  dbg "----- Backtrace START"
  for level = 2, 20 do
    local info = debug.getinfo(level, "Sln")
    if info and info.what ~= "C" and info.source ~= "lua" and not info.source:find("debug-helpers.lua", 1, true) then
      local line = "- `" .. vim.fn.fnamemodify(info.source:sub(2), ":p:~:.") .. "`:" .. info.currentline
      if info.name then line = line .. " _in_ **" .. info.name .. "**" end
      dbg(line)
    end
  end
  dbg "----- Backtrace END"
end
