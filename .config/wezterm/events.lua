local os = require 'os'
local wt = require 'wezterm'

wt.on(
  "edit-wezterm-config",
  function(window, pane)
    local files = "wezterm.lua keys.lua events.lua"
    local args = {
      os.getenv("SHELL"), "-c", "exec $VISUAL " .. files
    }
    window:perform_action(wt.action {SpawnCommandInNewTab =
      {cwd=wt.config_dir, args=args}}, pane)
  end
)

wt.on("window-config-reloaded", function(window, pane)
--   window:perform_action(wt.action{SpawnCommandInNewTab={args={"vim"}}}, pane)
--   window:perform_action(wt.action{SplitHorizontal={}}, pane)
  window:set_right_status(wt.format({
    {Attribute={Intensity="Bold"}},
    {Background={Color="blue"}},
    {Text="Configuration reloaded. "},
  }))
  wt.sleep_ms(3000)
  window:set_right_status("")
end)
