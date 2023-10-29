local M = {
	"hrsh7th/nvim-cmp",
	event = 'InsertEnter',
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms	"L3MON4D3/LuaSnip",
	},
}

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
    	local lspkind = require("lspkind")

	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	cmp.setup({
		snippet = { -- configure how nvim-cmp interacts with snippet engine
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<Tab>'] = cmp.mapping.select_next_item(),
			['<S-Tab>'] = cmp.mapping.select_prev_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "luasnip" }, -- For luasnip users.
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "orgmode" },
		}, {
			{ name = "buffer" }, -- text within current buffer
			{ name = "path" }, -- file system paths
		}),
		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M
