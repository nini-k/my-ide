--[[
	desc: Поиск
	repo: https://github.com/nvim-telescope/telescope.nvim

	TODO настроить внешний вид длинных путей
--]]

return {
	"nvim-telescope/telescope.nvim",
	branch = '0.1.x',
		build = false,
    dependencies = {
		{"nvim-lua/plenary.nvim", build = false},
		{"natecraddock/telescope-zf-native.nvim", build = false},
	},
	keys = {
		-- See :help telescope.builtin
		{"<leader>?", "<cmd>Telescope oldfiles<cr>"},        		   -- Search file history
		{"<leader>ff", "<cmd>Telescope find_files<cr>"},     		   -- Search all files
		{"<leader>fg", "<cmd>Telescope live_grep<cr>"},      		   -- Search in project
		{"<leader>fb", "<cmd>Telescope buffers<cr>"},        		   -- Search open files
		{"<leader>fe", "<cmd>Telescope diagnostics<cr>"},    		   -- Search diagnostics
		{"<leader>fr", "<cmd>Telescope lsp_references<cr>"}, 		   -- Search reference
		{"<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>"}, -- Search fuzzy search in current file
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup{
  			defaults = {
				path_display = {
					"absolute",
					shorten = 6,
				},
				file_ignore_patterns = {
					"node_modules/",
					"pkg/",
					"pb/",
					"%.pb.go",
					"%.pb.scratch.go",
					"%.pb.sensitivity.go",
					"%.pb.gw.go",
    				"%.swagger.json",
					"%_mock/",
					"%_mocks/",
					"mock/",
					"mocks/",
					"%_mock.go",
				},
    			mappings = {
      				i = {
        				["q"] = actions.close
      				},
    			},
			}
		}

  		pcall(require("telescope").load_extension, "zf-native")
	end
}

