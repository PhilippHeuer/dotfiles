-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- clear mappings
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>hp", "<nop>")
vim.keymap.set("n", "<C-q>", "<nop>")

-- core commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- builtin file explorer
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end) -- show open buffers
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>") -- close current buffer
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>") -- close all buffers
vim.keymap.set({"n", "i"}, "<C-w>", "<cmd>w<CR>") -- write current buffer
vim.keymap.set("n", "<leader>q", "<cmd>w<bar>bd<CR>") -- write and close current buffer

-- buffer navigation
vim.keymap.set("n", "<C-k>", "<cmd>bnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>bprev<CR>zz")

-- format current buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- ctrl + c to escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join the next line with the current line with space in between
vim.keymap.set("n", "J", "mzJ`z")

-- half page movement with curser staying in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- tmux sessionizer (tmux-sessionizer)
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tms<CR>")

-- cmd
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make current file executable

-- ui
vim.keymap.set("n", "<leader>ut", "<cmd>:TransparentToggle<CR>")
vim.keymap.set("n", "<leader>uc", "<cmd>:CloakToggle<CR>")

-- fun
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>");

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
