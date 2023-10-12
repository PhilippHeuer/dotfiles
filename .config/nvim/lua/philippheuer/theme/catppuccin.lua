-- [[ Configure Theme ]]

-- reuse git status from gitsigns
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

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
      vim.cmd.colorscheme 'catppuccin-mocha'
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
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
          'branch',
          {
            'diff',
            source = diff_source
          },
          'diagnostics'
        },
        lualine_c = {'filename'},
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
    },
  },
}
