--[[
	desc: Файловое древо
	repo: https://github.com/nvim-tree/nvim-tree.lua
--]]

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>t", ":NvimTreeToggle<CR>" },
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				side = "right",
				width = 60,
			},
			update_focused_file = {
				enable = true,
			},
			renderer = {
				icons = {
					glyphs = { default = "‣ " },
				},
				highlight_git = true,
				special_files = {
					"README.md",
					"Makefile",
					"MAKEFILE",
					"go.mod",
					"go.sum",
				},
				indent_markers = {
					enable = true
				}
			},
			filters = {
				enable = true,
				dotfiles = false,
				custom = {
					"node_modules",
					".cache",
					"pkg",
					"pb",
				},
				exclude = {},
			},
			open_on_tab = true
		})
	end,
}
