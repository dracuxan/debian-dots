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
require("autocommands.autosave")

local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

lspconfig.tsserver.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
}
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}


local sqls_config = require("autocommands.sqls")

require'lspconfig'.sqls.setup{
  cmd = {"sqls", "-config", "/home/beru/sqls/config.yml"};
  on_attach = function(client, bufnr)
    sqls_config.on_attach(client, bufnr) -- require sqls.nvim
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=prod dbname=stocksdb sslmode=disable',
        },
      },
    },
  },
}

vim.opt.mouse = ""

require'nvim-tree'.setup{
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

vim.lsp.set_log_level("debug")
