---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'aquarium',
  theme_toggle = { 'aquarium', "aquarium" },
  transparency = false,
  statusline = {
    theme = "vscode_colored",
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
