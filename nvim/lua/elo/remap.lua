local km = vim.keymap
-- debug
km.set("n", "<leader>ff", "<cmd>Files<CR>")
km.set("n", "<leader>fg", "<cmd>GFiles<CR>")
km.set("n", "<leader>rg", "<cmd>Rg<CR>")
km.set("n", "<leader>fb", "<cmd>Buffers<CR>")
km.set("n", "<leader>1", "<cmd>Le<CR>")
-- reset cfg
km.set("n", "<leader>xx", "<cmd>luafile $MYVIMRC<CR>")
