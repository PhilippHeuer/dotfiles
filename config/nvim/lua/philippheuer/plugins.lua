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
  'philippheuer.plugins.oil', -- file explorer
  'philippheuer.plugins.snacks', -- collection of small qol plugins
  -- 'philippheuer.plugins.http', -- http client
  'philippheuer.plugins.copilot', -- github copilot
  'philippheuer.plugins.completion', -- code completion
  'philippheuer.plugins.silicon', -- code screenshots (requirs local installation of silicon)
  -- 'philippheuer.plugins.neorg', -- note taking
  'philippheuer.plugins.markdown', -- markdown support
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
require('lazy').setup(loadedPlugins, {
  -- Git options
  git = {
    -- kill processes that take more than 30 seconds
    timeout = 30,
    -- throttle
    throttle = {
      enabled = true,
      rate = 5,
      duration = 1 * 1000,
    },
    -- time in seconds to wait before running fetch again for a plugin.
    cooldown = 0,
  },
})
