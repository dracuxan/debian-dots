---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'chadracula',
  theme_toggle = { 'chadracula', "chadracula" },
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
