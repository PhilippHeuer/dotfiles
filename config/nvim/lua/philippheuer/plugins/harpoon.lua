return {
  {
    'ThePrimeagen/harpoon',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
    keys = {
      { '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = 'Mark file with harpoon' },
      { '<leader>hr', '<cmd>lua require("harpoon.mark").rm_file()<cr>', desc = 'Unmark file with harpoon' },
      { '<C-t>', '<cmd>lua require("harpoon.ui").nav_next()<cr>', desc = 'Go to next harpoon mark' },
      { '<C-h>', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', desc = 'Go to previous harpoon mark' },
      -- { '<C-e>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = 'Show harpoon marks' }, -- harpoon menu
      { '<C-e>', '<cmd>:Telescope harpoon marks<cr>', desc = 'Show harpoon marks' }, -- telescope menu
    },
  },
}
