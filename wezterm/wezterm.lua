-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.freetype_load_flags = 'NO_HINTING'
config.font_size = 14
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
config.font = wezterm.font({
  family="Input Mono Narrow",
  --stretch="Expanded"
})
config.colors = {
    background = "000000",
    foreground = "ffffff"
}
config.hide_tab_bar_if_only_one_tab = true
config.leader = {key = ' ', mods = 'ALT', timeout_miliseconds=1000}
-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 3500
local act = wezterm.action
config.keys = {
  {
    key = 'a',
    mods = 'CTRL|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 's',
    mods = 'CTRL|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
    {
    key = "h",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = 'x',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  { key = 'p', mods = 'CTRL|SHIFT', action = act.ScrollByPage(-1) },
  { key = 'n', mods = 'CTRL|SHIFT', action = act.ScrollByPage(1) },
}

return config

