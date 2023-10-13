return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      -- required
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local utils = require("philippheuer.utils")

      require("telescope").setup {
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
      }

      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")

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
      vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
      vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
      vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sr", require("telescope.builtin").oldfiles, { desc = "[S]earch [r]ecent files" })
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
