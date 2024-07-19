--[[
	Файловое древо
--]]

-- TODO настроить символов гита
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
			},
			renderer = {
  	      		icons = {
  	        		glyphs = {default = "‣ "},
  	      		},
				highlight_git = true,
				special_files = {"README.md", "Makefile", "MAKEFILE"},
				indent_markers = {
					enable = true
				}
			},
			filters = {
				enable = true,
				dotfiles = true,
				custom = {"node_modules", ".cache"},
				exclude = {},
			},
  	  		open_on_tab = true
  		})
	end,
}
