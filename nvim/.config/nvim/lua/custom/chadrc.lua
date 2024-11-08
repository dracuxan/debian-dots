---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'dark_horizon',
  theme_toggle = {'dark_horizon', "dark_horizon"},
  transparency = true
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
