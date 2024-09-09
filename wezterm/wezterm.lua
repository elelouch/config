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
config.font_size = 13   
config.font = wezterm.font 'Hack Nerd Font Mono'
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
config.colors = {
    background = "000000",
    foreground = "ffffff"
}
config.hide_tab_bar_if_only_one_tab = true

return config
