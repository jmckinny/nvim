-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Quit
map("n", "<leader>q", vim.cmd.quit, { desc = "Quit file", silent = true })
map("n", "<leader>Q", vim.cmd.only, { desc = "Close all but this window", silent = true })
-- Avoid bad habits
map({ "n", "i" }, "<Left>", "<cmd>echo 'no arrow keys'<cr><esc>")
map({ "n", "i" }, "<Right>", "<cmd>echo 'no arrow keys'<cr><esc>")
map({ "n", "i" }, "<Down>", "<cmd>echo 'no arrow keys'<cr><esc>")
map({ "n", "i" }, "<Up>", "<cmd>echo 'no arrow keys'<cr><esc>")
-- Center paging
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Center search
map("n", "n", "nzz")
map("n", "N", "Nzz")
