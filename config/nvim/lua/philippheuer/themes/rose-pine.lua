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
    config = function()
      vim.cmd("TransparentEnable")
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      day_brightness = 0,
    },
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'tokyonight',
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
          {
            function()
              local active_context = vim.g.http_context_active
              if active_context ~= '' then
                return 'HTTP Context: ' .. active_context
              else
                return ''
              end
            end,
            color = {
              fg = '#FF0000',
              gui = 'bold'
            },
          },
          {
            function()
              local cloak_enabled = vim.b.cloak_enabled
              if cloak_enabled == nil or cloak_enabled == true then
                return ''
              end
              if cloak_enabled == false then
                return 'secrets visible '
              end
            end,
            color = {
              fg = '#FF0000',
              gui = 'bold'
            },
          },
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
