local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
local on_attach = require("plugins.lsp.custom").on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"go", "gomod", "gowork", "gotmpl",
	},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				fillreturns = true,
				fillstruct = true,
			},
		},
	},
}


vim.keymap.set("n", "<leader>fs", function()
	vim.lsp.buf.code_action {
		filter = function(x)
			return x.kind == "refactor.rewrite.fillStruct"
		end,
	}
end, {
	buffer = true,
})

vim.keymap.set("n", "<leader>fS", function()
	vim.lsp.buf.code_action {
		apply = true,
		filter = function(x)
			return x.kind == "refactor.rewrite.fillStruct"
		end,
	}
end, {
	buffer = true,
})
