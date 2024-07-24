--[[
	desc: Нижняя панель
	repo: https://github.com/nvim-lualine/lualine.nvim
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
				statusline = { "NvimTree" },
			},
		},
	},
	init = function()
		vim.opt.showmode = false
	end
}
