--[[
	desc: AI для автокомплита
	repo: https://github.com/tzachar/cmp-tabnine

	TODO удостоверится, что ai работает
--]]

return {
     "tzachar/cmp-tabnine",
     build = "./install.sh",
     dependencies = "hrsh7th/nvim-cmp",
}
