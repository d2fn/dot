#!/usr/bin/env bash

repos=(
  "https://github.com/hrsh7th/cmp-buffer"
  "https://github.com/hrsh7th/cmp-nvim-lsp"
  "https://github.com/hrsh7th/cmp-path"
  "https://github.com/L3MON4D3/LuaSnip"
  "https://github.com/hrsh7th/nvim-cmp"
  "https://github.com/folke/noice.nvim"
  "https://github.com/MunifTanjim/nui.nvim"
  "https://github.com/rcarriga/nvim-notify"
  "https://github.com/neovim/nvim-lspconfig"
  "https://github.com/oflisback/obsidian-bridge.nvim"
  "https://github.com/obsidian-nvim/obsidian.nvim"
  "https://github.com/nvim-lua/plenary.nvim"
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  "https://github.com/nvim-telescope/telescope.nvim"
  "https://github.com/nvim-tree/nvim-web-devicons"
  "https://github.com/akinsho/toggleterm.nvim"
)

for repo in "${repos[@]}"; do
  git -C ./start clone "$repo"
done

find ./start -mindepth 1 -maxdepth 1 | xargs -I{} git -C {} pull

