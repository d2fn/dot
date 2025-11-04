local harpoon = require("harpoon")
harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- Harpoon keybindings
local k = vim.keymap
local harpoon = require("harpoon")
k.set('n', '<leader>a', function() harpoon:list():add() end)
k.set('n', '<C-e>', function() toggle_telescope(harpoon:list()) end)
-- Toggle previous & next buffers stored within Harpoon list
k.set("n", "<C-S-h>", function() harpoon:list():prev() end)
k.set("n", "<C-S-l>", function() harpoon:list():next() end)

