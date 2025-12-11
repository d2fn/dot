require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "%.git/" },
    -- path_display = { "smart" },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      follow = true,
      theme = "dropdown",
      layout_config = {
        width = 0.95,       -- wider
        preview_width = 0.6,
      },
    },

    git_files = {
      theme = "dropdown",
      layout_config = {
        width = 0.95,
      },
    },

    live_grep = {
      additional_args = function(_)
        return {
          "--hidden",
          "--no-ignore-vcs",
          "--glob", "!.git/*"
        }
      end,
      theme = "dropdown",
      layout_config = {
        width = 0.95,
      },
    },
  }
})

