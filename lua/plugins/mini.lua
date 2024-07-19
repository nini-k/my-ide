--[[
	Различный набор плагинов с небольшими хелперами
--]]
return {
	"echasnovski/mini.nvim",
	branch = "stable",
	config = function()
		require("mini.pairs").setup({})        -- Автокомплит двойных скобок, ковычек
		require('mini.indentscope').setup({})  -- Линия разделяющая скоуп кода, например if
		require('mini.trailspace').setup()     -- Выделение и удаление лишних пробелов
	end
}
