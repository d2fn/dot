vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd.colorscheme("unokai")

local api = vim.api
api.nvim_set_hl(0, "Normal", { bg = "none" })
api.nvim_set_hl(0, "NormalNC", { bg = "none" })
api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

require('plugins.obsidian')
require('plugins.telescope')
require('plugins.lsp')
require('keybindings')

local o = vim.opt

-- Basic Settings
o.number = true                          -- Line numbers
o.relativenumber = true                  -- Relative line numbers
o.cursorline = true                      -- Highlight current line
o.wrap = false                           -- Don't wrap lines
o.scrolloff = 10                         -- Keep 10 lines above/below cursor
o.sidescrolloff = 8                      -- Keep 8 columns left/right of cursor

-- Indentation
o.tabstop = 2                            -- Tab width
o.shiftwidth = 2                         -- Indent width
o.softtabstop = 2                        -- Soft tab stop
o.expandtab = false                      -- Use spaces instead of tabs
o.smartindent = true                     -- Smart auto-indenting
o.autoindent = true                      -- Copy indent from current line

-- Search
o.ignorecase = true                      -- Case insensitive search
o.smartcase = true                       -- But case sensitive if there is an uppercase character
o.hlsearch = false                       -- Highlight search results
o.incsearch = true                       -- Show matches as you type

-- Visual settings
o.termguicolors = true                   -- Enable 24-bit colors
o.signcolumn = "yes"                     -- Always show sign column
o.colorcolumn = "100"                    -- Show column highlighted at 100 chars
o.showmatch = true                       -- Highlight matching brackets
o.matchtime = 2                          -- Show matching brackets for 2s
o.cmdheight = 1                          -- Command line height
o.completeopt = "menuone,noinsert,noselect"
o.showmode = true                        -- Don't show insert/visual/regular mode in cmd line
o.pumheight = 10                         -- Popup menu height
o.pumblend = 10                          -- Popup menu transparency
o.winblend = 0                           -- Floating window transparency
o.conceallevel = 0                       -- Don't hide markup
o.concealcursor = ""                     -- Don't hide cursor line markup
o.lazyredraw = true                      -- Don't redraw during macros
o.synmaxcol = 300                        -- Syntax highlighting limit

-- File handling
o.backup = false                         -- Don't create backup files
o.writebackup = false                    -- Don't create backup before writing
o.swapfile = false                       -- Don't create swap files
o.undofile = false                       -- Persistent undo when closing reopening a file
o.undodir = vim.fn.expand("~/.vim/undodir")
o.updatetime = 300                       -- faster completion
--o.timeoutlen = 0                         -- Key timeout duration
--o.ttimeoutlen = 0                        -- Key code timeout
o.autoread = true                        -- Auto reload file changed outside vim
o.autowrite = false                      -- Don't auto save

-- Behavior settings
o.hidden = true                          -- Allow hidden buffers
o.errorbells = false                     -- No error bells
o.backspace = "indent,eol,start"         -- Improved backspace behavior
o.autochdir = false                      -- Don't auto change directory
o.iskeyword:append("-")                  -- Treat dash as part of a word
o.path:append("**")                      -- Include subdirectories in search
o.selection = "exclusive"                -- Selection behavior
o.mouse = "a"                            -- Enable mouse
o.clipboard:append("unnamedplus")        -- Use system clipboard
o.modifiable = true                      -- Allow buffer modification
o.encoding = "UTF-8"                     -- Set encoding

-- Cursor settings
-- o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nc" -- conceal in normal & command modes
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
  end,
})

-- reload file on focus
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

