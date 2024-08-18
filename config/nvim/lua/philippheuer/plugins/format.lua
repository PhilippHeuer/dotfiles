return {
  -- renovate: datasource=github-releases depName=stevearc/conform.nvim
  'stevearc/conform.nvim',
  tag = 'v7.1.0',
  event = {
    'BufReadPre',
    'BufNewFile'
  },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        -- lua
        lua = { 'stylua' },
        -- python
        python = { 'isort', 'black' },
        -- javascript
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        -- golang
        go = { 'gofmt', 'goimports' },
        -- serialization formats
        json = { 'prettier' },
        yaml = { 'prettier' },
        -- markdown
        markdown = { 'prettier' },
        -- graphql
        graphql = { 'prettier' },
        -- trim whitespaces for all non specified files
        ['_'] = { 'trim_whitespace' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })
  end,
  keys = {
    { '<leader>f', function()
      local conform = require('conform')

      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, mode = {'n'}, desc = 'format current file or range (in visual mode)' },
  },
}
