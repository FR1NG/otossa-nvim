local M = {
		{
			"williamboman/mason.nvim",
			config = function()
			require("mason").setup()
			end
		},
	    	{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup {
					ensure_installed = { "lua_ls", "tsserver", "clangd" },
					automatic_installation = true,
				}
			end
		},
	}
return M
