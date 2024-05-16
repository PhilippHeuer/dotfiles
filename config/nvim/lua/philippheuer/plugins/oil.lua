return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("oil").setup {
        columns = { 'icon' },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hdden = true,
        }
      }

      vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = "Open parent directory" })
    end,
  },
}
