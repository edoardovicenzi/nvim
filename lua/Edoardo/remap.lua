vim.g.mapleader = " "

--Main remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Put deleted selection in void register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection  to the system register" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to the system register" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Put deleted selection in void register" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from the system register" })

-- Window Management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window motions
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window up" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

-- Tabs Management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })


-- LSP diagnostic
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float(nil, { focus = false }) end,
  { desc = "Show diagnostic" })
--Oil.nvim

vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--QuickFix
-- (<C-q> in telescope)


vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "QuickFix next item." })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "QuickFix previous item." })
vim.keymap.set("n", "<M-o>", "<cmd>copen<CR>", { desc = "Open QuickFix." })
vim.keymap.set("n", "<M-c>", "<cmd>close<CR>", { desc = "Close QuickFix." })
