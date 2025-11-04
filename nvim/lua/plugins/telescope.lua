require('telescope').setup({
	defaults = {
		file_ignore_patterns = { "%.git/" },
		path_display={"smart"},
	},
	pickers = {

		find_files = {
			hidden = true,
			no_ignore = true,
			follow = true,
			theme = "dropdown",

		},

		git_files = {
			theme = "dropdown"
		},

		live_grep = {
			additional_args = function(_)
				return {
					"--hidden",         -- include hidden files
					"--no-ignore-vcs",  -- ignore .gitignore and friends
					"--glob", "!.git/*" -- still skip .git itself
				}
			end,
			theme = "dropdown",
		}

	}
})

