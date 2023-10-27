local M = { 
	'rcarriga/nvim-notify',
	config = function ()
		vim.notify = require("notify")	
	end
}

return M
