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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      day_brightness = 0,
    },
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'tokyonight',
        component_separators = '|',
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
    },
  },
}
