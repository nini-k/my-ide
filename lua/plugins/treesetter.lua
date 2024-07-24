--[[
	desc: Подцветка синтаксиса
	repo: https://github.com/nvim-treesitter/nvim-treesitter
--]]

return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	-- See :help nvim-treesitter-modules
	opts = {
		auto_install = true,
		highlight = { enable = true },
		ensure_installed = {
			"go",
			"yaml",
			"json",
			"make",
			"lua",
			"vim",
			"vimdoc",
			"markdown",
			"sql",
			"regex",
			"proto",
			"gitignore",
			"gitattributes",
			"csv",
			"bash",
		},
	},
}
