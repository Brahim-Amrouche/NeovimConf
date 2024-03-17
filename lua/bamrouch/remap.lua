vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<leader>y", "+y", { noremap = true })
vim.keymap.set("n", "<leader>Y", "+yg_", { noremap = true })
vim.keymap.set("v", "<leader>y", "+y", { noremap = true })  -- Works in visual mode
vim.keymap.set("v", "<leader>Y", "+yg_", { noremap = true })
