require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
		side = "right",
	},
	renderer = {
		group_empty = true,
		root_folder_label = false,
	},
	filters = {
		dotfiles = false,
	},
})
