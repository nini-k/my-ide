--[[
	desc: Настройка и переопределение хоткеев vim-а
--]]

local map   = vim.api.nvim_set_keymap           -- set global keymap
local g     = vim.g                             -- global variables
local opts  = { noremap = true, silent = true } -- keymap options

g.mapleader = ","                            -- rebind <Leader> key

map("n", "<leader>e", ":wq<cr>", opts)       -- quick quit command
map("n", "<leader>E", ":qa!<cr>", opts)      --
map("n", "<leader>WE", ":wqa<cr>", opts)     --

-- split nav
map("n", "<C-J>", "<C-W><C-J>", opts) -- bind easier split navigations
map("n", "<C-K>", "<C-W><C-K>", opts) -- instead of ctrl-w then k, it’s just ctrl-k
map("n", "<C-L>", "<C-W><C-L>", opts) --
map("n", "<C-H>", "<C-W><C-H>", opts) --

-- tab nav
map("n", "<leader>1", "1gt", opts)              -- tab swithing
map("n", "<leader>2", "2gt", opts)              --
map("n", "<leader>3", "3gt", opts)              --
map("n", "<leader>4", "4gt", opts)              --
map("n", "<leader>5", "5gt", opts)              --
map("n", "<leader>6", "6gt", opts)              --
map("n", "<leader>7", "7gt", opts)              --
map("n", "<leader>8", "8gt", opts)              --
map("n", "<leader>9", "9gt", opts)              --
map("n", "<leader>0", "<cmd>tablast<cr>", opts) --

-- nav
map("n", "gp", ":b#<cr>", opts) -- return previes buffer

-- clear highlight
map("n", "<leader>c", ":nohl<cr>", opts) -- bind nohl
map("v", "<leader>c", ":nohl<cr>", opts) -- removes highlight of your last search
map("i", "<leader>c", ":nohl<cr>", opts) --


map("v", "<", "<gv", opts)                 -- easier moving of code blocks. try to go into visual mode (v), thenselect several lines of code here and
map("v", ">", ">gv", opts)                 -- then press ``>`` several times

map("n", "<leader>w", ":w<cr>", opts)      -- fast saving
map("i", "<leader>w", "<C-s>:w<cr>", opts) --

map("i", "kk", "<Esc>", opts)              -- press kk to exit

-- don"t use arrow keys
map("", "<up>", "<nop>", opts)    --
map("", "<down>", "<nop>", opts)  --
map("", "<left>", "<nop>", opts)  --
map("", "<right>", "<nop>", opts) --
