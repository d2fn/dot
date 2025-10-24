#!/usr/bin/env bash

repos=(

	# other plugins
	"https://github.com/L3MON4D3/LuaSnip"
	"https://github.com/akinsho/toggleterm.nvim"
	"https://github.com/hrsh7th/cmp-buffer"
	"https://github.com/hrsh7th/cmp-nvim-lsp"
	"https://github.com/hrsh7th/cmp-path"
#	"https://github.com/hrsh7th/nvim-cmp"
	"https://github.com/lewis6991/gitsigns.nvim.git"
	"https://github.com/neovim/nvim-lspconfig"
	"https://github.com/nvim-lua/plenary.nvim"
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim"
	"https://github.com/nvim-telescope/telescope.nvim"
	"https://github.com/nvim-tree/nvim-web-devicons"
	"https://github.com/nvim-treesitter/nvim-treesitter.git"
	"https://github.com/obsidian-nvim/obsidian.nvim"
	"https://github.com/oflisback/obsidian-bridge.nvim"
	"https://github.com/rafamadriz/neon.git"
	"https://github.com/rcarriga/nvim-notify"

	# java
	"https://github.com/mfussenegger/nvim-jdtls.git"

	# colors
	"https://github.com/folke/tokyonight.nvim.git"
	"https://github.com/catppuccin/nvim.git"

)

for repo in "${repos[@]}"; do
	git -C ./start clone "$repo"
done

find ./start -mindepth 1 -maxdepth 1 | xargs -I{} git -C {} pull

