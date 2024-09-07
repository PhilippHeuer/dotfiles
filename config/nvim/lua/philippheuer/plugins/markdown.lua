return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true, -- enable lazy load
    ft = 'markdown', -- lazy load on file type
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('render-markdown').setup({
        heading = {
            enabled = true, -- Turn on / off heading icon & background rendering
            sign = true, -- Turn on / off any sign column related rendering
        },
        code = {
          enabled = true, -- Turn on / off code block & inline code rendering
          sign = true, -- Turn on / off any sign column related rendering
          style = 'full', -- how code blocks & inline code are rendered (none, normal, language, full)
        },
      })
    end,
  },
}
