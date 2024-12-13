---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'ashes',
  theme_toggle = { 'ashes', "ashes" },
  transparency = false,
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
