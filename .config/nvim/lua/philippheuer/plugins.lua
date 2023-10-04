-- Configure Plugins
local plugins = {
  {
    name = 'philippheuer.plugins.editorconfig',
  },
  {
    name = 'philippheuer.plugins.comment',
  },
  {
    name = 'philippheuer.plugins.todo-comment',
  },
  {
    name = 'philippheuer.plugins.lspconfig',
  },
  {
    -- NOTE: cloak sensitive information
    name = 'philippheuer.plugins.cloak',
  },
  {
    -- NOTE: add colored ident lines
    name = 'philippheuer.plugins.ident',
    config_name = 'philippheuer.plugins.ident-config',
  },
  {
    -- NOTE: documentation for keymaps
    name = 'philippheuer.plugins.whichkey',
    config_name = 'philippheuer.plugins.whichkey-config',
  },
  {
    -- NOTE: git status for the gutter
    name = 'philippheuer.plugins.git',
  },
  {
    -- NOTE: telescope for fuzzy finding (files, lsp, etc)
    name = 'philippheuer.plugins.telescope',
    config_name = 'philippheuer.plugins.telescope-config',
  },
  {
    -- NOTE: treesitter for syntax highlighting
    name = 'philippheuer.plugins.treesitter',
    config_name = 'philippheuer.plugins.treesitter-config',
  },
  {
    -- NOTE: quick file access
    name = 'philippheuer.plugins.harpoon',
  },
  {
    -- NOTE: github copilot
    name = 'philippheuer.plugins.copilot',
    config_name = 'philippheuer.plugins.copilot-config',
  },
  {
    -- NOTE: code completion
    name = 'philippheuer.plugins.completion',
    config_name = 'philippheuer.plugins.completion-config',
  },
  {
    -- NOTE: useless, but fun
    name = 'philippheuer.plugins.fun',
  },
  -- Theme / UI
  {
    name = 'philippheuer.plugins.theme',
  },
}

-- Load Plugins
local loadedPlugins = {}
for _, plugin in ipairs(plugins) do
  local loaded_plugin = require(plugin.name)
  table.insert(loadedPlugins, loaded_plugin)
end

-- Plugins
require('lazy').setup(loadedPlugins, {})

-- Apply Settings
local loadedPlugins = {}
for _, plugin in ipairs(plugins) do
  if plugin.config_name then
    require(plugin.config_name)
  end
end
