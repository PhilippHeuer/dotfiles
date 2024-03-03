-- Configure Plugins
local plugins = {
  -- Core
  'philippheuer.plugins.lspconfig',
  'philippheuer.plugins.editorconfig',
  'philippheuer.plugins.tmux',
  'philippheuer.plugins.comment',
  'philippheuer.plugins.flash', -- flash jump / select
  'philippheuer.plugins.todo-comment', -- highlighting for todo comments
  'philippheuer.plugins.dressing', -- improves some default vim ui elements (input, select, ...)
  'philippheuer.plugins.cloak', -- cloak sensitive information
  'philippheuer.plugins.format', -- formatting for various file types
  'philippheuer.plugins.lint', -- linting for various file types
  'philippheuer.plugins.ident', -- add colored ident lines
  'philippheuer.plugins.whichkey', -- documentation for keymaps
  'philippheuer.plugins.git', -- git status for the gutter
  'philippheuer.plugins.telescope', -- fuzzy finding (files, lsp, etc)
  'philippheuer.plugins.treesitter', -- syntax highlighting
  'philippheuer.plugins.harpoon', -- bookmark files
  'philippheuer.plugins.http', -- http client
  'philippheuer.plugins.copilot', -- github copilot
  'philippheuer.plugins.completion', -- code completion
  -- Theme / UI
  'philippheuer.themes.current', 
}

-- Load Plugins
local loadedPlugins = {}
for _, plugin in ipairs(plugins) do
  local loaded_plugin = require(plugin)
  table.insert(loadedPlugins, loaded_plugin)
end

-- Plugins
require('lazy').setup(loadedPlugins, {})
