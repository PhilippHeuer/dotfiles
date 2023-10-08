-- [[ Configure Theme ]]
return {
  {
    -- Transparent background (provides vim.g.transparent_enabled)
    'xiyaowong/transparent.nvim',
    opts = {
      extra_groups = {
        "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "NvimTreeNormal", -- NvimTree
        "TelescopeNormal", -- Telescope
        "TelescopeBorder", -- Telescope border
      },
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'mocha',
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        harpoon = true,
        which_key = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    },
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
      },
    },
  },
}
