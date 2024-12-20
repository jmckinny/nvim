return {
  "saghen/blink.cmp",
  lazy = false,
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    keymap = { preset = "super-tab", ["<CR>"] = { "accept", "fallback" } },
  },
}
