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

lspconfig.omnisharp.setup {
  settings = {
    FormattingOptions = {
      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      EnableEditorConfigSupport = true,
      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      OrganizeImports = nil,
    },
    MsBuild = {
      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      LoadProjectsOnDemand = nil,
    },
    RoslynExtensionsOptions = {
      -- Enables support for roslyn analyzers, code fixes and rulesets.
      EnableAnalyzersSupport = nil,
      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      EnableImportCompletion = nil,
      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      AnalyzeOpenDocumentsOnly = nil,
    },
    Sdk = {
      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      IncludePrereleases = true,
    },
  },

  filetypes = { 'cs', 'vb' },
  -- root_dir = util.root_pattern('*.sln', '*.csproj', 'omnisharp.json', 'function.json'),
  on_new_config = function(new_config, _)
    -- Get the initially configured value of `cmd`
    new_config.cmd = { unpack(new_config.cmd or {}) }

    -- Append hard-coded command arguments
    table.insert(new_config.cmd, '-z') -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
    vim.list_extend(new_config.cmd, { '--hostPID', tostring(vim.fn.getpid()) })
    table.insert(new_config.cmd, 'DotNet:enablePackageRestore=false')
    vim.list_extend(new_config.cmd, { '--encoding', 'utf-8' })
    table.insert(new_config.cmd, '--languageserver')

    -- Append configuration-dependent command arguments
    local function flatten(tbl)
      local ret = {}
      for k, v in pairs(tbl) do
        if type(v) == 'table' then
          for _, pair in ipairs(flatten(v)) do
            ret[#ret + 1] = k .. ':' .. pair
          end
        else
          ret[#ret + 1] = k .. '=' .. vim.inspect(v)
        end
      end
      return ret
    end
    if new_config.settings then
      vim.list_extend(new_config.cmd, flatten(new_config.settings))
    end

    -- Disable the handling of multiple workspaces in a single instance
    new_config.capabilities = vim.deepcopy(new_config.capabilities)
    new_config.capabilities.workspace.workspaceFolders = false -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
  end,
  init_options = {},
}

-- -- Get the installation path for jdtls
-- local jdtls_path = '/home/beru/.local/share/nvim/mason/packages/jdtls'
--
-- lspconfig.jdtls.setup{
-- cmd = {
--     'java',
--     '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',  -- Update the JAR file name as needed
--     '-configuration', jdtls_path .. '/config_linux',
--     '-data', '/home/beru/java',
--   },
--   settings = {
--     java = {
--       home = '/usr/lib/jvm/java-17-openjdk-amd64', -- Update this to your JDK path if necessary
--       format = {
--         enabled = true,
--       },
--       completion = {
--         favoriteStaticMembers = {
--           "org.junit.Assert.*",
--           "org.junit.Assume.*",
--           "org.junit.jupiter.api.Assertions.*",
--         },
--       },
--     },
--   },
-- }

lspconfig.jdtls.setup{}
-- lspconfig.ts_ls.setup{}
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
