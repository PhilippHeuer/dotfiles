-- [[ GitHub Copilot ]]
return {
  {
    -- github/copilot.vim
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          javascript = true,
          typescript = true,
          sh = function ()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
              return false -- disable for .env files
            end
            return true
          end,
        },
        suggestion = {
          auto_trigger = true,
        },
      })
    end,
    keys = {
      { "<leader>cpt", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", desc = "copilot toggle suggestions" },
      { "<tab>", "<cmd>lua require('copilot.suggestion').accept_line()<cr>", mode = "i", desc = "copilot accept suggestion", {expr=true, silent=true} },
      { "<M-l>", "<cmd>lua require('copilot.suggestion').dismiss()<cr>", mode = "i", desc = "copilot dismiss suggestion", {expr=true, silent=true} },
      { "<M-j>", "<cmd>lua require('copilot.suggestion').next()<cr>", mode = "i", desc = "copilot next suggestion", {expr=true, silent=true} },
      { "<M-k>", "<cmd>lua require('copilot.suggestion').prev()<cr>", mode = "i", desc = "copilot previous suggestion", {expr=true, silent=true} },
    },
  },
}
