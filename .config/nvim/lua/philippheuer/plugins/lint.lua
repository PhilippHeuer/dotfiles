return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- python
      python = { "pylint" },
      -- golang
      go = { "golangcilint" },
    }

    local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear=true })
    vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, { -- "TextChanged"
      group = lint_autogroup,
      callback = function()
        lint.try_lint()
      end,
    })

  end,
  keys = {
    { "<leader>l", function()
      local lint = require("lint")

      lint.try_lint()
    end, mode = {"n"}, desc = "lint current file" },
  },
}
