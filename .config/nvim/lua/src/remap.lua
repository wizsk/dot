-- mapping leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- cursor
vim.opt.guicursor = ""
-- cp pasete
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")


-- puter @bal sal
vim.keymap.set("n", "q", "<nop>")
