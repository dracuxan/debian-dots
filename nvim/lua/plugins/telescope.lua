local vim = vim
local sizes = {
	bottom_left_height = math.floor(vim.o.lines * 0.45),
	bottom_left_width = 70,
	center_height = math.floor(vim.o.lines * 0.6),
	center_width = math.floor(vim.o.columns * 0.6),
}

local bottom_left_layout = {
	layout_strategy = "vertical",
	layout_config = {
		height = sizes.bottom_left_height,
		width = sizes.bottom_left_width,
		prompt_position = "top",
		anchor = "SW",
	},
}

local bottom_left_pickers = { "find_files", "current_buffer_fuzzy_find", "buffers" }

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
			},
			current_buffer_fuzzy_find = { previewer = false },
			buffers = { previewer = false },
		},
	},
	config = function(_, opts)
		for _, picker in ipairs(bottom_left_pickers) do
			opts.pickers[picker] = vim.tbl_extend("force", opts.pickers[picker], bottom_left_layout)
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
			"<C-b>",
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
