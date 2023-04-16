-- Pull in the wezterm API
local wezterm = require 'wezterm'

function getHostname()
    local f = io.popen ("/bin/hostname -s")
    local hostname = f:read("*a") or ""
    f:close()
    hostname =string.gsub(hostname, "\n$", "")
    return hostname
end

local hostname = getHostname()

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'nord'

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font_with_fallback { 'Hack Nerd Font', 'Droid Sans Fallback', 'Noto Sans Symbols 2' }

if hostname == "alex-pc" then
	config.font_size = 12
else
	config.font_size = 11.5
  config.freetype_load_target = "Light"
end

-- and finally, return the configuration to wezterm
return config
