local M = {
	"neovim/nvim-lspconfig",
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'antosha417/nvim-lsp-file-operations', config = true }
	}
}

M.config = function()
	-- Setup language servers.
	local lspconfig = require('lspconfig')
	local cmp_nvim_lsp = require('cmp_nvim_lsp')

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set('n', '<space>k', vim.diagnostic.open_float)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<cr>', opts)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<space>la', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<space>lr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<space>ll', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<space>gq', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end,
	})

	-- used to enable autocompletion (assign to every lsp server config)
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- Change the Diagnostic symbols in the sign column (gutter)
	-- (not in youtube nvim video)
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
	-- configure html server
	lspconfig["eslint"].setup({
		capabilities = capabilities,
	})

	-- configure html server
	lspconfig["html"].setup({
		capabilities = capabilities,
	})
	-- configure typescript server with plugin
	lspconfig["tsserver"].setup({
		capabilities = capabilities,
	})

	-- configure php server with plugin
	lspconfig["intelephense"].setup({
		capabilities = capabilities,
	})

	-- configure vuejs server with plugin
	lspconfig["volar"].setup({
		capabilities = capabilities,
	})
	-- configure css server
	lspconfig["cssls"].setup({
		capabilities = capabilities,
	})

	-- configure tailwindcss server
	lspconfig["tailwindcss"].setup({
		capabilities = capabilities,
	})

	-- configure tailwindcss server
	lspconfig["clangd"].setup({
		capabilities = capabilities,
	})


	-- configure prisma orm server
	lspconfig["prismals"].setup({
		capabilities = capabilities,
	})

	-- configure emmet language server
	lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		filetypes = { "html", "vue", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
	})

	-- configure python server
	lspconfig["pyright"].setup({
		capabilities = capabilities,
	})

	-- configure lua server (with special settings)
	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})
end
return M
