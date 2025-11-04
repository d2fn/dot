require('nvim-treesitter.configs').setup({
	ensure_installed = { 'go', 'gomod', 'gowork', 'gosum', 'java' },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false, -- don’t double-apply
	},
})
