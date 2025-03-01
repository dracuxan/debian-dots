---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'kanagawa',
  theme_toggle = { 'kanagawa', "kanagawa" },
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
