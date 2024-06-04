return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
	local telescope = require("telescope.builtin")
	vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
	vim.keymap.set('n', '<leader>rg', telescope.live_grep, {})
  end
}
