-- local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config['gopls'] = {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
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

