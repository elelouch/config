local km = vim.keymap
-- debug
km.set("n", "<leader>ff", "<cmd>Files<CR>")
km.set("n", "<leader>fg", "<cmd>Rg<CR>")
km.set("n", "<leader>fb", "<cmd>Buffers<CR>")
-- reset cfg
km.set("n", "<leader>xx", "<cmd>luafile $MYVIMRC<CR>")
