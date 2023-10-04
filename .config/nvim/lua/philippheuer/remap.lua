-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- quality of life
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- ctrl + c to escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
vim.keymap.set("n", "<C-f>", "<cmd>!tms<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

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

-- noop
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>hp", "<nop>")
