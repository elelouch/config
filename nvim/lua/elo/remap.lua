local km = vim.keymap
-- debug
km.set("n", "<leader>ff", "<cmd>Files<CR>")
km.set("n", "<leader>fg", "<cmd>Giles<CR>")
km.set("n", "<leader>rg", "<cmd>Rg<CR>")
km.set("n", "<leader>b", "<cmd>Buffers<CR>")
-- reset cfg
km.set("n", "<leader>xx", "<cmd>luafile $MYVIMRC<CR>")
