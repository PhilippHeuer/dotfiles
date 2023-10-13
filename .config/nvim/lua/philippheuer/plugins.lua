-- Configure Plugins
local plugins = {
  'philippheuer.plugins.lspconfig',
  'philippheuer.plugins.editorconfig',
  'philippheuer.plugins.tmux',
  'philippheuer.plugins.comment',
  'philippheuer.plugins.todo-comment',
  'philippheuer.plugins.dressing', -- improves some default vim ui elements (input, select, ...)
  -- NOTE: cloak sensitive information
  'philippheuer.plugins.cloak',
  -- NOTE: add colored ident lines
  'philippheuer.plugins.ident',
  -- NOTE: documentation for keymaps
  'philippheuer.plugins.whichkey',
  -- NOTE: git status for the gutter
  'philippheuer.plugins.git',
  -- NOTE: telescope for fuzzy finding (files, lsp, etc)
  'philippheuer.plugins.telescope',
  -- NOTE: treesitter for syntax highlighting
  'philippheuer.plugins.treesitter',
  -- NOTE: quick file access
  'philippheuer.plugins.harpoon',
  -- NOTE: http client
  'philippheuer.plugins.http',
  -- NOTE: github copilot
  'philippheuer.plugins.copilot',
  -- NOTE: code completion
  'philippheuer.plugins.completion',
  -- NOTE: useless, but fun
  'philippheuer.plugins.fun',
  -- Theme / UI
  'philippheuer.theme.catppuccin',
}

-- Load Plugins
local loadedPlugins = {}
for _, plugin in ipairs(plugins) do
  local loaded_plugin = require(plugin)
  table.insert(loadedPlugins, loaded_plugin)
end

-- Plugins
require('lazy').setup(loadedPlugins, {})
