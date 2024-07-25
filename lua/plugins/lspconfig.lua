--[[
	desc: Конфигурация модуля Neovim-а для работы LSP
	repo: https://github.com/neovim/nvim-lspconfig
--]]

return {
  "neovim/nvim-lspconfig",
	cmd = {"LspInfo", "LspInstall", "LspUnInstall"},
	event = {"BufReadPre", "BufNewFile"},
	dependencies =  {
  		{"hrsh7th/cmp-nvim-lsp"},
  		{"williamboman/mason.nvim"},
  		{"williamboman/mason-lspconfig.nvim"},
	},
	init = function()
  	-- See :help vim.diagnostic.config()
  		vim.diagnostic.config({
  	  		virtual_text = true,
  	  		severity_sort = false,
  	  		float = {
  	    		border = "rounded",
  	    		source = true,
  	  		},
  	  		signs = {
  	    		text = {
  	      			[vim.diagnostic.severity.ERROR] = '×',
  	      			[vim.diagnostic.severity.WARN] = '⚠',
  	      			[vim.diagnostic.severity.HINT] = '⚑',
  	      			[vim.diagnostic.severity.INFO] = 'ℹ',
  	    		},
  	  		},
  		})

  		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  	  		vim.lsp.handlers.hover,
  	  		{border = "rounded"}
  		)

  		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  	  		vim.lsp.handlers.signature_help,
  	  		{border = "rounded"}
  		)
	end,
	config = function()
  		local lspconfig = require("lspconfig")
  		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  		local group = vim.api.nvim_create_augroup("lsp_cmds", {clear = true})

  		vim.api.nvim_create_autocmd("LspAttach", {
  		  group = group,
  		  desc = "LSP actions",
  		  callback = require("plugins.lsp.custom").on_attach,
  		})

  		-- See :help mason-lspconfig-settings
  		require("mason-lspconfig").setup({
  	  		handlers = {
  	    		-- See :help mason-lspconfig-dynamic-server-setup
  	    		function(server)
  	      			-- See :help lspconfig-setup
  	      			lspconfig[server].setup({
  	        			capabilities = lsp_capabilities,
  	      			})
  	    		end,
  	    		["lua_ls"] = function()
  	      			-- if you install the language server for lua it will
  	      			-- load the config from lua/plugins/lsp/lua_ls.lua
					require('plugins.lsp.lua_ls')
  	  			end,
				["gopls"] = function()
  	      			-- if you install the language server for lua it will
  	      			-- load the config from lua/plugins/lsp/lua_ls.lua
					require('plugins.lsp.gopls')
  	  			end,
  	  		}
  		})
	end,
}

