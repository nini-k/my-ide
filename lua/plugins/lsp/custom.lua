local M = {}

function M.on_attach(event)
	local bufmap = function(mode, lhs, rhs, desc)
		local opts = { buffer = event.buf, desc = desc }
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
	bufmap('n', 'rr', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename references')
end

return M
