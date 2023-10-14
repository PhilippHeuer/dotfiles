return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- json and yaml schema store
      { "b0o/schemastore.nvim" },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require("fidget").setup({})`
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
    config = function()
      -- Setup Tools (Linters, Formatters, etc.)
      require("mason-tool-installer").setup {
        ensure_installed = {
          -- formatters
          "stylua",
          "prettier",
          "isort",
          "black",
          "goimports",

          -- linters
          "golangci-lint",
          "pylint",
        },
        auto_update = false,
        run_on_start = false,
        start_delay = 3000,
      }
    end,
  },
  {
    "folke/trouble.nvim",
    event = { "BufRead" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      auto_open = false,
      mode = "workspace_diagnostics",
    },
  },
}
