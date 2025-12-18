local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- (optional) customize gopls
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
  -- settings = { gopls = { ... } },
})

-- enable it (it will attach automatically on Go buffers)
vim.lsp.enable("gopls")

-- Pass on_attach to pyright
vim.lsp.config['pyright'] = {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
			}
		}
	}
}

vim.lsp.config['lua_ls'] = {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT', -- Neovim uses LuaJIT
			},
			diagnostics = {
				globals = { 'vim' }, -- stop "undefined global 'vim'" errors
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false, -- disable annoying prompts
			},
			telemetry = { enable = false },
		}
	}
}
