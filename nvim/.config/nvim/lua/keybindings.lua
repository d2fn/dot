
local k = vim.keymap

-- Generic keybindings
k.set({'n','i'}, '<C-s><C-s>', '<cmd>w<CR>', { noremap = true, desc = "Save" })
k.set('n', '<leader>so', '<cmd>source ~/.config/nvim/init.lua<CR>', { noremap = true, desc = "Source" })
k.set("n", "<leader><leader>", "<C-^>", { desc = "Switch to last file" })

-- improved navigation of text wrapping
k.set('n', 'j', 'gj', { noremap = true })
k.set('n', 'k', 'gk', { noremap = true })
k.set('n', 'gj', 'j', { noremap = true })
k.set('n', 'gk', 'k', { noremap = true })

-- move lines up/down
k.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
k.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
k.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
k.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down up" })

-- list chars
k.set('n', "<leader>l", function()
	vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle listchars" })
-- set a subtle gray for listchars
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#5c6370" })

-- Improved indenting in visual mode
k.set("v", "<", "<gv", { desc = "Indent left, retain selection" })
k.set("v", ">", ">gv", { desc = "Indent right, retain selection" })

-- Center screen when jumping
k.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
k.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
k.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
k.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Telescope
local telescope = require('telescope.builtin')
k.set('n', '<leader>ff', telescope.find_files, {})
k.set('n', '<leader>fg', telescope.live_grep, {})
k.set('n', '<leader>fc', '<cmd>Telescope colorscheme<CR>', {})

-- Obsidian
k.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "New note" })
k.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", { desc = "Today's daily note" })
k.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Backlinks" })
k.set("n", "<leader>of", "<cmd>ObsidianBridgeFollow<CR>", { desc = "Open in Obsidian" })


