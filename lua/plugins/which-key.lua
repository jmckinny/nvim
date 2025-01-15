return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
  },
  require("which-key").add({ "<leader>ct", group = "ctags" }),
  require("which-key").add({ "<leader>si", group = "internet" }),
}
