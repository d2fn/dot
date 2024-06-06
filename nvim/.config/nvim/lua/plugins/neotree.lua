return {
  {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
	  "nvim-lua/plenary.nvim",
	  "nvim-tree/nvim-web-devicons",
	  "MunifTanjim/nui.nvim",
	},
	config = function()
	  vim.keymap.set('n', '<leader>t', ':Neotree filesystem toggle left<CR>')
	  require('neo-tree').setup({
		window = {
		  mappings = {
			['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
			['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
			['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
		  }
		}
	  })
	end
  },
}
