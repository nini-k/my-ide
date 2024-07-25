--[[
	desc: Настройка и переодпределение команд
--]]

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- Для работы прозрачности в терминале alacritty
vim.api.nvim_create_autocmd('ColorScheme', {
	callback = function()
		local highlights = {
			'Normal',
			'LineNr',
			'Folded',
			'NonText',
			'SpecialKey',
			'VertSplit',
			'SignColumn',
			'EndOfBuffer',
			'TablineFill', -- this is specific to how I like my tabline to look like
		}
		for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end
	end,
})

-- Форматирование при сохранении файла
vim.api.nvim_create_autocmd("BufWritePre", {
	command = "lua vim.lsp.buf.format()"
})

-- Копированиe полного пути к редактируемого файла
vim.api.nvim_create_user_command("CopyFullPath", function()
		local path = vim.fn.expand("%:p")
		vim.fn.setreg("+", path)
		vim.notify('Copied "' .. path .. '" to the clipboard!')
	end,
	{}
)
