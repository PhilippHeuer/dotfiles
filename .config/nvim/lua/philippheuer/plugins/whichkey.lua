return {
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜ ", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
      }
    },
    config = function()
      -- [[ document command categories ]]
      require('which-key').register({
        ['<leader>u'] = { name = '[U]I', _ = 'which_key_ignore' },
        ['<leader>l'] = { name = '[L]ayout', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      })
    end,
  },
}
