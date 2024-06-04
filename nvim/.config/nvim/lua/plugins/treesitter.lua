return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
	local treesitter = require("nvim-treesitter.configs")
	treesitter.setup({
	  ensure_installed = { "c", "rust", "javascript", "typescript", "go", "lua", "java" },
	  highlight = { enable = true },
	  indent = { enable = true },
	})
  end
}
