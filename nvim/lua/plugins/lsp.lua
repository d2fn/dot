local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config['gopls'] = {
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
			semanticTokens = true,
		},
	},
}

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
