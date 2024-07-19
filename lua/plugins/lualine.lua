--[[
	Нижняя панель
--]]

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
  	    options = {
  	      theme = "gruvbox",
  	      icons_enabled = true,
  	      component_separators = '|',
  	      section_separators = '',
  	      disabled_filetypes = {
  	        statusline = {"NvimTree"},
  	      },
  	    },
	},
	init = function()
  	    vim.opt.showmode = false
	end
}

