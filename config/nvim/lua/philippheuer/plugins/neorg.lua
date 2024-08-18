return {
  {
    -- renovate: datasource=github-releases depName=nvim-neorg/neorg
    'nvim-neorg/neorg',
    lazy = true, -- enable lazy load
    ft = 'norg', -- lazy load on file type
    cmd = 'Neorg', -- lazy load on command
    version = 'v9.1.1',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/source/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }
    end,
  },
}
