return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    highlight = {
      before = "",
      keyword = "wide_bg",
      after = "empty",
    },
  },
  keys = {
    { "<leader>st", "<cmd>:TodoTelescope<cr>", desc = "[S]earch [T]odos" },
  },
}
