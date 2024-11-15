local km = vim.keymap
-- debug
km.set("n", "<leader>1", "<cmd>Le<CR>")
km.set("n", "<leader>bf", "<cmd>Format<CR>")
-- reset cfg

local opts = { noremap = true, silent = true }
km.set("n", "<leader>e", vim.diagnostic.open_float, opts)
km.set("n", "[d", vim.diagnostic.goto_prev, opts)
km.set("n", "]d", vim.diagnostic.goto_next, opts)
km.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
