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
config.font = wezterm.font("JetBrains Mono")
config.colors = {
    background = "161616",
    foreground = "eeeeee"
}
config.hide_tab_bar_if_only_one_tab = true
config.leader = {key = ' ', mods = 'CTRL', timeout_miliseconds=1000}

local act = wezterm.action
config.keys = {
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
    {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "t",
    mods = "LEADER",
    action = act.SpawnTab 'DefaultDomain'
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}

return config
