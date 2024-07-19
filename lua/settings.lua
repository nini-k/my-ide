--[[
	desc: Базовые настройки vim-a

	use :help 'option_name' command
	For example, :help 'hlsearch'
--]]

local g    = vim.g         	   -- global variables
local o    = vim.o         	   -- global options
local b    = vim.bo        	   -- buffer-scoped options
local w    = vim.wo        	   -- windows-scoped options
local fn   = vim.fn       	   -- call Vim functions
local cmd  = vim.cmd     	   -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript

o.bs            = "2"           -- enable mouse support
o.mouse         = "a"           -- enable mouse support
o.swapfile      = false         -- don't use swapfile
o.clipboard     = "unnamedplus" -- copy/paste to system clipboard
o.hidden        = true          -- enable background buffers
o.history       = 100           -- remember n lines in history
b.synmaxcol     = 320           -- max column for syntax highlight
o.lazyredraw    = true          -- faster scrolling
o.tabstop       = 4             -- 1 tab == 4 spaces
o.expandtab     = true          -- use spaces instead of tabs
o.shiftwidth    = 4             -- shift 4 spaces when tab
o.smartindent   = true          -- autoindent new lines
o.syntax        = "enable"      -- enable syntax highlighting
w.number        = true          -- show line number
o.showmatch     = true          -- highlight matching parenthesis
o.smartcase     = true          -- ignore lowercase for the whole pattern
w.foldmethod    = "indent"      -- enable folding (default "foldmarker")
o.splitright    = true          -- vertical split to the right
o.splitbelow    = true          -- orizontal split to the bottom
o.ignorecase    = true          -- ignore case letters when search
o.termguicolors = true
o.number        = true
o.signcolumn    = 'yes'
o.wrap          = false
o.expandtab     = false
