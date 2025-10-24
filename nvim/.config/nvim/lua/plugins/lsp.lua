-- local lspconfig = require('lspconfig')

local cmp = require('cmp')
cmp.setup({
	snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	},
	sources = { {name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'}},
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP keymaps when a server attaches
local on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	-- Info & navigation
	map("n", "K", vim.lsp.buf.hover, "LSP Hover docs")
	map("n", "<C-k>", vim.lsp.buf.signature_help, "LSP Signature help")

	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
	map("n", "gr", vim.lsp.buf.references, "Find references")
	map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")

	-- Refactors / fixes
	map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")

	-- Diagnostics
	map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
	map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
end

vim.lsp.config['gopls'] = {
	on_attach = on_attach,
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
	on_attach = on_attach,
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

-- define/modify the JDTLS config using the new API
vim.lsp.config("jdtls", {
	on_attach = on_attach,
	settings = {
		java = {
			imports = {
				gradle = {
					wrapper = {
						checksums = {
							{ sha256 = "81a82aaea5abcc8ff68b3dfcb58b3c3c429378efd98e7433460610fecd7ae45f", allowed = true },
						}
					}
				}
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-24",
						path = "/home/d/.sdkman/candidates/java/24.0.2-oracle",
						default = true,
					}
				}
			}
		}
	}
})

