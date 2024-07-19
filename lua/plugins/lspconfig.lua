--[[
	desc: Конфигурация модуля Neovim-а для работы LSP
	repo: https://github.com/neovim/nvim-lspconfig
--]]

local user = {}

function user.on_attach(event)
  local bufmap = function(mode, lhs, rhs, desc)
    local opts = {buffer = event.buf, desc = desc}
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- You can search each function in the help page.
  -- For example :help vim.lsp.buf.hover()
  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover documentation')
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation')
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Go to type definition')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', 'Go to reference')
  bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show function signature')
  bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol')
  bufmap('n', '<leader>l', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format buffer')
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show line diagnostic')
  bufmap('n', 'gE', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Previous diagnostic')
  bufmap('n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next diagnostic')
end

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
  		  callback = user.on_attach
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
  	  		end
  	  		}
  		})
	end,
}

