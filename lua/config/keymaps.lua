-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>q", vim.cmd.quit, { desc = "Quit file", silent = true })
map("n", "<leader>Q", vim.cmd.only, { desc = "Close all but this window", silent = true })
