-- local lspconfig = require('lspconfig')

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

