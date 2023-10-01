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
          file_pattern = {'.env*', '*.properties'},
          cloak_pattern = {':.+', '-.+', '=.+'},
        },
      },
    }
  },
}
