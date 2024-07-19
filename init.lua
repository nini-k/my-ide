--[[
	desc: Главный фаил инициализации подключающий все модули

	TODO Понять, для чего нужна load функция с точки зрения lua. Предположительно, чтобы не отрабатывал кэш
--]]

local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('settings')
load('commands')
load('keymaps')
require('plugin-manager')

vim.cmd.colorscheme "gruvbox"
