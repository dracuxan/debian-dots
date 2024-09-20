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

-- Get the installation path for jdtls
local jdtls_path = '/home/beru/.local/share/nvim/mason/packages/jdtls'

lspconfig.jdtls.setup{
cmd = {
    'java',
    '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',  -- Update the JAR file name as needed
    '-configuration', jdtls_path .. '/config_linux',
    '-data', '/home/beru/java',
  },
  settings = {
    java = {
      home = '/usr/lib/jvm/java-17-openjdk-amd64', -- Update this to your JDK path if necessary
      format = {
        enabled = true,
      },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.junit.jupiter.api.Assertions.*",
        },
      },
    },
  },
}

lspconfig.tsserver.setup{}
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
