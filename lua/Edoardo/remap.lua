vim.g.mapleader = " "

--Main remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move selected block down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move selected block up"})

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Put deleted selection in void register"})

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Yank selection  to the system register"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Yank line to the system register"})

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], {desc = "Put deleted selection in void register"})
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]], {desc = "Paste from the system register"})


--Window Management
vim.keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split window vertically"})
vim.keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split window horizontally"})
vim.keymap.set("n", "<leader>se", "<C-w>=", {desc = "Make splits equal size"})
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Close current split"})

--Tabs Management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab"})
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"})
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "Go to next tab"})
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "Go to previous tab"})
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "Open current buffer in new tab"})

