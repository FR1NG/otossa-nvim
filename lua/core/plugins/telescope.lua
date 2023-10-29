local M = {
	'nvim-telescope/telescope.nvim',
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')

    		telescope.load_extension("fzf")
		telescope.setup({
		      defaults = {
			path_display = { "truncate " },
			mappings = {
			  -- i = {
			    -- ["<C-k>"] = actions.move_selection_previous, -- move to prev result
			    -- ["<C-j>"] = actions.move_selection_next, -- move to next result
			    -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			  -- },
			},
		      },
		    })

		vim.keymap.set('n', '<leader>f', builtin.find_files, {desc = 'Find files in CWD'})
		vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {desc = 'Find old files'})
		vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = 'Live grep'})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end
}
return M
