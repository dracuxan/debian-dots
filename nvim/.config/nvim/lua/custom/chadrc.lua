---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'aquarium',
  theme_toggle = { 'aquarium', "aquarium" },
  transparency = true,
  statusline = {
    theme = "vscode_colored",
  },
  tabufline = {
    enabled = true,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
