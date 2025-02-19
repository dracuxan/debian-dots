local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[ ███╗   ██╗██╗███████╗ █████╗ ██████╗  ██████╗  ]],
  [[ ████╗  ██║██║██╔════╝██╔══██╗██╔══██╗██╔════╝  ]],
  [[ ██╔██╗ ██║██║███████╗███████║██████╔╝██║  ███╗ ]],
  [[ ██║╚██╗██║██║╚════██║██╔══██║██╔══██╗██║   ██║ ]],
  [[ ██║ ╚████║██║███████║██║  ██║██║  ██║╚██████╔╝ ]],
  [[ ╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ]],


}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
  dashboard.button("n", "  New file", "<cmd>ene | startinsert<cr>"),
  dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
  dashboard.button("c", "  Config", "<cmd>e $MYVIMRC<cr>"),
  dashboard.button("s", "  Restore Session", "<cmd>lua require('persistence').load()<cr>"),
  dashboard.button("q", "  Quit", "<cmd>qa<cr>")
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"

dashboard.opts.layout[1].val = 8

return dashboard.config
