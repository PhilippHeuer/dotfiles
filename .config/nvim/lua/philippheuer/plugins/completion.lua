return {
    {
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        -- snippets
        "L3MON4D3/LuaSnip", -- snipet engine
        "saadparwaiz1/cmp_luasnip", -- snippet engine nvim-cmp source
        -- completion
        "hrsh7th/cmp-nvim-lsp", -- lsp completion capabilities
        "hrsh7th/cmp-buffer", -- buffer completion
        "hrsh7th/cmp-path", -- file path completion
        "rafamadriz/friendly-snippets", -- Adds a number of user-friendly snippets
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.config.setup {}

        cmp.setup {
          completion = {
            completeopt = "menu,menuone,preview,noselect",
          },
          -- configures how nvim-cmp interacts with the snippet engine
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert {
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete {}, -- show completion suggestions
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          },
          sources = {
            { name = "nvim_lsp" }, -- lsp
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within current buffer
            { name = "path" }, -- file path completion
          },
        }
      end,
    },
}
