return {
  -- navigator
  "christoomey/vim-tmux-navigator",
  keys = {
    -- primary mappings
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", mode = {"n", "i"}, desc = "switch to left pane", {silent=true} },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>", mode = {"n", "i"}, desc = "switch to down pane", {silent=true} },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>", mode = {"n", "i"}, desc = "switch to up pane", {silent=true} },
    { "<C-l>", "<cmd>TmuxNavigateRight<CR>", mode = {"n", "i"}, desc = "switch to right pane", {silent=true} },
    -- secondary mappings
    { "<M-Left>", "<cmd>TmuxNavigateLeft<CR>", mode = {"n", "i"}, desc = "switch to left pane", {silent=true} },
    { "<M-Down>", "<cmd>TmuxNavigateDown<CR>", mode = {"n", "i"}, desc = "switch to down pane", {silent=true} },
    { "<M-Up>", "<cmd>TmuxNavigateUp<CR>", mode = {"n", "i"}, desc = "switch to up pane", {silent=true} },
    { "<M-Right>", "<cmd>TmuxNavigateRight<CR>", mode = {"n", "i"}, desc = "switch to right pane", {silent=true} },
  },
}
