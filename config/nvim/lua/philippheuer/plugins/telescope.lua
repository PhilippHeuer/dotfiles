return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      -- required
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      local actions = require("telescope.actions")
      local utils = require("philippheuer.utils")

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
              ["<C-k>"] = actions.move_selection_previous, -- select previous item
              ["<C-j>"] = actions.move_selection_next, -- select next item
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send all selected items to quickfix list
            },
          },
        },

        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[S]earch [B]uffers" })
      vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch [B]uffers" })
      vim.keymap.set("n", "<leader>sc", function()
        require("telescope.builtin").current_buffer_fuzzy_find({
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            preview_width = 0.5,
          },
        })
      end, { desc = "[S]earch [c]urrent buffer" })

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- search in files tracked by git
      vim.keymap.set("n", "<leader>sgf", function()
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
      end, { desc = "[S]earch [G]it [F]iles" })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function() 
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      -- telescope picker - tmx projects
      project_picker = function()
        local output = vim.fn.system("tmx project --mode telescope")
        if vim.v.shell_error ~= 0 then
          print("Error executing command: " .. output)
          return
        end
        local results = vim.fn.json_decode(output)

        local finders = require("telescope.finders")
        local sorters = require("telescope.sorters")
        local action_state = require("telescope.actions.state")

        return require("telescope.pickers").new {
          prompt_title = "Search for Projects",
          finder = finders.new_table{
            results = results,
            entry_maker = function (x) return x end,
          },
          sorter = sorters.fuzzy_with_index_bias(),
          selection_strategy = "row",
          attach_mappings = function(prompt_bufnr, map)
            -- Map the enter key to run the command on the selected item
            map("i", "<CR>", function()
              local selection = action_state.get_selected_entry()
              require("telescope.actions").close(prompt_bufnr)
              os.execute(string.format("tmx project --select \"%s\"", selection.value))
            end)

            return true
          end,
        }:find()
      end
      vim.keymap.set("n", "<leader>sp", project_picker, { desc = "[S]earch [P]roject" })

    end,
  },
}
