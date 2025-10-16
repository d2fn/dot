require('telescope').setup({
	defaults = {
		file_ignore_patterns = { "%.git/" },
	},
	pickers = {

		find_files = {
			hidden = true,
			no_ignore = true,
			follow = true,
		},

		live_grep = {
			hidden = true,
			no_ignore = true,
			follow = true,
		},

	}
})

