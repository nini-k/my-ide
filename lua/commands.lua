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

-- Копирование ссылки строки в GitLab
vim.api.nvim_create_user_command("CopyGitLabLink", function()
		local file_path = vim.fn.expand("%:.")
		if file_path == "" then
			vim.notify("No file path found", vim.log.levels.ERROR)
			return
		end

		local remote_url = vim.fn.system("git remote get-url origin"):gsub("%s+", "")
		if remote_url == "" then
			vim.notify("No git remote found", vim.log.levels.ERROR)
			return
		end

		local domain = remote_url:match("git@([^:]+):")
		if domain then
			remote_url = "https://" .. domain .. "/" .. remote_url:gsub("git@[^:]+:", ""):gsub("%.git$", "")
		else
			remote_url = remote_url:gsub("%.git$", "")
		end

		local branch = vim.fn.system("git branch --show-current"):gsub("%s+", "")
		if branch == "" then
			branch = "main"
		end

		local gitlab_link = remote_url .. "/-/blob/" .. branch .. "/" .. file_path .. "#L" .. vim.fn.line(".")
		vim.fn.setreg("+", gitlab_link)
		vim.notify('Copied GitLab link: ' .. gitlab_link)
	end,
	{}
)
