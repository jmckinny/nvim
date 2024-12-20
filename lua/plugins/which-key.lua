return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
  },
  require("which-key").add({ "<leader>t", group = "tags" }),
  require("which-key").add({ "<leader>si", group = "internet" }),
}
