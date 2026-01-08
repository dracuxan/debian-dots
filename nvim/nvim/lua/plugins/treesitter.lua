return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({})

		-- Install parsers
		local parsers = {
			"lua",
			"python",
			"javascript",
			"typescript",
			"vimdoc",
			"vim",
			"regex",
			"terraform",
			"sql",
			"dockerfile",
			"toml",
			"json",
			"java",
			"groovy",
			"go",
			"gitignore",
			"graphql",
			"yaml",
			"make",
			"cmake",
			"markdown",
			"markdown_inline",
			"bash",
			"tsx",
			"css",
			"html",
			"rust",
			"zig",
		}

		-- Auto-install parsers
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local ft = vim.bo.filetype
				local lang = vim.treesitter.language.get_lang(ft) or ft
				if vim.tbl_contains(parsers, lang) then
					pcall(vim.treesitter.start)
				end
			end,
		})

		-- Install missing parsers on startup
		vim.schedule(function()
			for _, lang in ipairs(parsers) do
				pcall(function()
					if not pcall(vim.treesitter.language.inspect, lang) then
						vim.cmd("TSInstall " .. lang)
					end
				end)
			end
		end)
	end,
}
