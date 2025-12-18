local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup({
  ensure_installed = { "go", "gomod", "gowork", "gosum", "java" },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
})


