local vim = vim
local sizes = {
	center_height = math.floor(vim.o.lines * 0.6),
	center_width = math.floor(vim.o.columns * 0.6),
}

local function pct(value, total)
	return math.floor(total * value)
end

local picker_layouts = {
	find_files = { height = 0.4, width = 0.5, anchor = "SW" },
	current_buffer_fuzzy_find = { height = 0.4, width = 0.5, anchor = "SW" },
	buffers = { height = 0.45, width = 0.5, anchor = "SW" },
}

local function builtin(name, opts)
	return function()
		require("telescope.builtin")[name](opts)
	end
end

return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"echasnovski/mini.icons",
	},
	opts = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob",
				"!.git/",
			},
			layout_strategy = "center",
			layout_config = {
				height = sizes.center_height,
				width = sizes.center_width,
				prompt_position = "top",
				anchor = "S",
			},
			sorting_strategy = "ascending",
			previewer = false,
			border = true,
		},
		pickers = {
			find_files = {
				previewer = false,
				hidden = true,
			},
			current_buffer_fuzzy_find = { previewer = false },
			buffers = { previewer = false },
		},
	},
	config = function(_, opts)
		for picker, layout in pairs(picker_layouts) do
			opts.pickers[picker] = vim.tbl_extend("force", opts.pickers[picker], {
				layout_strategy = "vertical",
				layout_config = {
					height = pct(layout.height, vim.o.lines),
					width = pct(layout.width, vim.o.columns),
					prompt_position = "top",
					anchor = layout.anchor,
				},
			})
		end

		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("session-lens")
	end,

	keys = {
		{
			"<leader><leader>",
			builtin("find_files"),
			desc = "Find Files in project directory",
		},
		{
			"<leader>fg",
			builtin("live_grep"),
			desc = "Find by grepping in project directory",
		},
		{
			"<leader>fc",
			builtin("find_files", { cwd = vim.fn.stdpath("config") }),
			desc = "Find in neovim configuration",
		},
		{
			"<leader>fh",
			builtin("help_tags"),
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fk",
			builtin("keymaps"),
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>fB",
			builtin("builtin"),
			desc = "[F]ind [B]uiltin Telescope",
		},
		{
			"<leader>fw",
			builtin("grep_string", { search = vim.fn.expand("<cword>") }),
			desc = "[F]ind current [W]ord",
		},
		{
			"<leader>fW",
			builtin("grep_string", { search = vim.fn.expand("<cWORD>") }),
			desc = "[F]ind current [W]ORD",
		},
		{
			"<leader>fd",
			builtin("diagnostics", { bufnr = 0 }),
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fr",
			builtin("resume"),
			desc = "[F]ind [R]esume",
		},
		{
			"<leader>fo",
			builtin("oldfiles"),
			desc = "[F]ind [O]ld Files",
		},
		{
			"<leader>b",
			builtin("buffers"),
			desc = "[,] Find existing buffers",
		},
		{
			"<leader>/",
			builtin("current_buffer_fuzzy_find"),
			desc = "[/] Live grep the current buffer",
		},
	},
}
