#!/usr/bin/env bash

repos=(
  "https://github.com/hrsh7th/cmp-buffer"
  "https://github.com/hrsh7th/cmp-nvim-lsp"
  "https://github.com/hrsh7th/cmp-path"
  "https://github.com/L3MON4D3/LuaSnip"
  "https://github.com/hrsh7th/nvim-cmp"
  "https://github.com/neovim/nvim-lspconfig"
	"https://github.com/oflisback/obsidian-bridge.nvim"
  "https://github.com/epwalsh/obsidian.nvim"
  "https://github.com/nvim-lua/plenary.nvim"
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  "https://github.com/nvim-telescope/telescope.nvim"
	"https://github.com/stevearc/oil.nvim"
	"https://github.com/nvim-tree/nvim-web-devicons"
)

for repo in "${repos[@]}"; do
  git clone "$repo"
done

ls -d */ | xargs -I{} git -C {} pull

