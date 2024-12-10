require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.opt.mouse = ""

-- Reset the cursor style on exit
vim.cmd([[
  if exists('$NVIM_TUI_ENABLE_CURSOR_SHAPE')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
  endif
  autocmd VimLeave * set guicursor=a:ver25
]])


require 'nvim-tree'.setup {
  view = {
    side = 'right',
  }
}

vim.wo.relativenumber = true
vim.wo.number = true

-- Disable line numbers in Nvim Tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nvim-tree",
  callback = function()
    vim.wo.relativenumber = false
    vim.wo.number = false
  end
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("lsp", { clear = true }),
--   callback = function(args)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = args.buf,
--       callback = function()
--         vim.lsp.buf.format { async = false, id = args.data.client_id }
--       end,
--     })
--   end
-- })

vim.lsp.set_log_level("debug")
