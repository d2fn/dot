-- Obsidian
require('obsidian').setup({
	dir = '~/Documents/Base',
	daily_notes = {
		foldes = "daily",
	},
	workspaces = {
		{
			name = "Netflix",
			path = "~/Documents/Netflix",
		},
		{
			name = "Base",
			path = "~/Documents/Base",
		},
	},
	legacy_commands = false,
	conceallevel = 1,
})

require("obsidian-bridge").setup({
  obsidian_server_address = "http://localhost:27123",  -- default port
  scroll_sync = true,  -- can enable if you want synced scrolling
})

