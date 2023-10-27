local M = {
  "nvim-treesitter/nvim-treesitter",
  config = function()
 	require('nvim-treesitter').setup()
  end
}

return M
