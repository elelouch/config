local km = vim.keymap
-- debug
local builtin = require('telescope.builtin')
km.set('n', '<leader>ff', builtin.find_files, {})
km.set('n', '<leader>fg', builtin.live_grep, {})
km.set('n', '<leader>fb', builtin.buffers, {})
km.set('n', '<leader>fh', builtin.help_tags, {})

km.set("n", "<leader>1", "<cmd>Le<CR>")
km.set("n", "<leader>bf", "<cmd>Format<CR>")
km.set("n", "<leader>nt", "<cmd>Neotree<CR>")
km.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- reset cfg
km.set("n", "<leader>xx", "<cmd>luafile $MYVIMRC<CR>")

local opts = { noremap = true, silent = true }
km.set("n", "<leader>e", vim.diagnostic.open_float, opts)
km.set("n", "[d", vim.diagnostic.goto_prev, opts)
km.set("n", "]d", vim.diagnostic.goto_next, opts)
km.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

