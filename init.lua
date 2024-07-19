-- TODO Разбирись, что это означает
local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('settings')
load('commands')
load('keymaps')
require('plugin-manager')

vim.cmd.colorscheme "gruvbox"
