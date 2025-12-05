vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
			-- LSP keymaps when a server attaches
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		-- Info & navigation
		local telescope = require('telescope.builtin')

		map("n", "gh", vim.lsp.buf.hover, "LSP Hover docs")
		map("n", "gs", vim.lsp.buf.signature_help, "LSP Signature help")
		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")

		map("n", "gr", telescope.lsp_references, "Go to type definition")
		map("n", "gm", telescope.lsp_document_symbols, "List symbols in document")
		-- map("n", "gr", vim.lsp.buf.references, "Find references")

		map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")

		-- Refactors / fixes
		map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")

		-- Diagnostics
		map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
		map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
		map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
	end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
		vim.opt_local.tabstop = 2                            -- Tab width
		vim.opt_local.shiftwidth = 2                         -- Indent width
		vim.opt_local.softtabstop = 2                        -- Soft tab stop
		vim.opt_local.expandtab = true                       -- Use spaces instead of tabs
		require('lsp.jdtls').setup()
  end,
})
 
--- vim.api.nvim_create_autocmd("BufWritePre", {
---   pattern = "*.nix",
---   callback = function() vim.lsp.buf.format() end,
--- })

--
-- Native LSP setup for Nix using the new API
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function(args)
    -- Avoid starting multiple clients for the same buffer
    local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "nil_ls" })
    if #clients > 0 then
      return
    end

    vim.lsp.start({
      name = "nil_ls",
      cmd = { "nil" },  -- the language server binary
      root_dir = vim.fs.dirname(vim.fs.find({
        "flake.nix",
        "default.nix",
        "shell.nix",
        ".git",
      }, { path = args.file, upward = true })[1]),

      -- optional settings passed to nil
      settings = {
        ["nil"] = {
          formatting = {
            command = { "nixfmt" },  -- or "nixfmt-rfc-style", "alejandra", etc., if installed
          },
        },
      },
    })
  end,
})
