return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      -- required
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      local utils = require("philippheuer.utils")

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>sc', function()
        require('telescope.builtin').current_buffer_fuzzy_find({
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            preview_width = 0.5,
          },
        })
      end, { desc = '[S]earch [c]urrent buffer' })
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[S]earch [r]ecent files' })
      vim.keymap.set('n', '<leader>sgf', function()
        local cmd = {
          "sort",
          "-u",
          "<(git diff --name-only --cached)",
          "<(git diff --name-only)",
          "<(git diff --name-only --diff-filter=U)",
        }

        if not utils.is_git_directory() then
          vim.notify("Current directory is not a git directory", vim.log.levels.WARN, { title = "Telescope Git Files", git_command = cmd })
        else
          require("telescope.builtin").git_files()
        end
      end, { desc = '[S]earch [G]it [F]iles' })
    end,
  },
}
