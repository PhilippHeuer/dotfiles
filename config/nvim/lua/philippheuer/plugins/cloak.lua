return {
  {
    'laytan/cloak.nvim',
    opts = {
      enabled = true,
      cloak_character = '*',
      highlight_group = 'Comment',
      cloak_length = 8, -- hide length
      try_all_patterns = true,
      patterns = {
        {
          file_pattern = {
            '.env*',
            '*.properties',
          },
          cloak_pattern = {
            ':.+',
            '-.+',
            '=.+',
          },
        },
        -- HTTP Request
        {
          file_pattern = {
            '*.http',
          },
          cloak_pattern = {
            "(Authorization:%s*Bearer%s+)%S+",
          },
          replace = '%1',
        },
        -- HTTP Response
        {
          file_pattern = {
            'rest_nvim_results',
          },
          cloak_pattern = {
            "-H \"Authorization: (\\S+)\"", -- curl command
          },
        },
      },
      -- cloak_on_buffer_hidden = true,
    },
  },
}
