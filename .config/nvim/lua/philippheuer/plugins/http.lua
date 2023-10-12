return {
  {
    "rest-nvim/rest.nvim",
    lazy = true,
    ft = { "http" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        result_split_in_place = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true, -- toggle showing URL, HTTP info, headers at top the of result window
          show_curl_command = true,
          show_http_info = true,
          show_headers = true,
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
    keys = {
      { "<leader>rr", "<Plug>RestNvim<CR>", mode = {"n"}, desc = "executes the current request", {silent=true} },
      { "<leader>rd", "<cmd>RestSelectEnv env/dev.json<CR>:lua vim.g.http_context_active = 'dev'<CR>", mode = {"n"}, desc = "swap to development context", {silent=true} },
      { "<leader>rs", "<cmd>RestSelectEnv env/stage.json<CR>:lua vim.g.http_context_active = 'stage'<CR>", mode = {"n"}, desc = "swap to staging context", {silent=true} },
      { "<leader>rp", "<cmd>RestSelectEnv env/prod.json<CR>:lua vim.g.http_context_active = 'prod'<CR>", mode = {"n"}, desc = "swap to production context", {silent=true} },
      { "<leader>rl", "<Plug>RestLog<CR>", mode = {"n"}, desc = "shows the rest log", {silent=true} },
    },
  },
}
