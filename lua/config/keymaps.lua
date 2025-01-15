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
-- Move selected lines with shift+j or shift+k
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- Duplicate a line and comment out the first line
map("n", "yc", "<cmd>norm yygcc<cr>p", { noremap = true, desc = "Duplicate line and comment original" })
-- Zen mode
map("n", "<leader>z", function()
  Snacks.zen()
end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function()
  Snacks.zen.zoom()
end, { desc = "Toggle Zoom Mode" })
-- ctags
map("n", "<leader>tb", "<cmd>!ctags .<cr><esc>", { noremap = true, desc = "Build ctags" })
map("n", "<leader>tl", vim.cmd.tags, { noremap = true, desc = "List ctags" })
-- Search Internet
local function search_internet_for(text)
  local char_to_hex = function(c)
    return string.format("%%%02X", string.byte(c))
  end

  local function urlencode(url)
    if url == nil then
      return
    end
    url = url:gsub("\n", "\r\n")
    url = url:gsub("([^%w ])", char_to_hex)
    url = url:gsub(" ", "+")
    return url
  end

  local encoded_line = urlencode(text)
  local url = "https://duckduckgo.com/?q=" .. encoded_line
  local output = vim.system({ "xdg-open", url }):wait()
  if output["stdout"] ~= nil then
    vim.notify(output["stdout"])
  else
    vim.notify(output["stderr"], vim.log.levels.ERROR)
  end
end

map("n", "<leader>siw", function()
  local word = vim.fn.expand("<cword>")
  search_internet_for(word)
end, { noremap = true, desc = "Search internet for word" })

map("n", "<leader>sil", function()
  local line = vim.api.nvim_get_current_line()
  search_internet_for(line)
end, { noremap = true, desc = "Search internet for line" })
